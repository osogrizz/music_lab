require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'better_errors'
require 'pry'
require 'sinatra/activerecord'



configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

set :conn , PG.connect(dbname:'music_lab')

before do
  @conn = settings.conn
end

# ARTIST ROUTES
get '/' do
  redirect '/artists'
end

# SHOW ALL ARTIST
get '/artists' do
  artist = []
  @conn.exec ("SELECT * FROM artists") do |result|
    result.each do |squad|
      artists << artist   
    end
  end
  @artists = artist
  erb :index
end

# ADD NEW ARTIST FORM
get '/artists/new' do
  erb :new
end

# SHOW INDIVIDUAL artists
get '/artists/:id' do
  id = params[:id].to_i
  artist = @conn.exec("SELECT * FROM artists WHERE id = ($1)", [id])
  
  @artist = artist[0]
  erb :show
end

# EDIT artists FORM
get '/artists/:id/edit' do
  id = params[:id].to_i
  artist = @conn.exec("SELECT * FROM artists WHERE id=$1", [id])
  @artist = artist[0]
  erb :edit
end 
# ADD ACTION
post '/artists' do
  name = params[:name]
  genre = params[:genre]
  @conn.exec("INSERT INTO artists (name, genre) VALUES($1,$2)",[name,genre])
  redirect 'artists'
end
# EDIT ACTION
put '/artists/:id' do 
  name = params[:name]
  genre = params[:genre]
 @conn.exec("INSERT INTO artists (name, genre) VALUES ($1,$2)",[name, genre])
  
  redirect '/artists'
end
# DESTROY ACTION
delete '/artists/:id' do
  id = params[:id].to_i
  @conn.exec("DELETE FROM artists WHERE id=$1", [id])
  redirect '/artists'
end






