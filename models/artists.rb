# class Artist
#   attr_reader :id
#   attr_accessor :name, :genre

#   def initialize params, existing=false
#     @id = params[:id]
#     @name = params[:name]
#     @genre = params[:genre]
#     @existing = existing
#   end


#   def existing?
#     @existing
#   end

#   def self.conn= connection
#     @conn = connection
#   end

#   def self.conn
#     @conn
#   end

#   def self.all
#     @conn.exec("SELECT * FROM artists")
#   end

#   def self.find id
#     new @conn.exec("SELECT * FROM artists WHERE id = ($1)", [id])[0], true
#   end

#   def save
#     if existing?
#       Artist.conn.exec("UPDATE artists SET name=$1, genre=$2 WHERE id=$3", [name, genre, id])
#     else
#       Artist.conn.exec("INSERT INTO artists (name, genre) VALUES ($1, $2)", [name, genre])
#     end
#   end

#   def self.create params
#     new(params).save
#   end

#   def destroy
#     Artist.conn.exec("DELETE FROM artists WHERE id=$1", [id])
#   end

# end




