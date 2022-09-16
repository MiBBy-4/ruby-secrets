require_relative 'main'

album = Album.new
group = Group.new

p album.public_methods false
p '=' * 20
p group.public_methods false
