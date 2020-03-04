class WelcomeController < ApplicationController
  helper_method :get_images
  def index
    @posts = Post.first(12)
  end
  def get_images (artist_id, album_name)
    require 'rspotify'
    RSpotify.authenticate("5d6d6aee639f4c6ea5bb73e642ee54a3", "f2331f75e56a4cd2b64ef68c0a489fe3")
    artists = RSpotify::Artist.search(artist_id, limit: 1, market: 'US')
    albums = artists[0].albums(album_type: 'album,single',country: 'US')
    $i = 0
    while $i < albums.length  do
      if albums[$i].name == album_name
        break
      end
      $i +=1
   end
   image_string = albums[$i].images
   image_string = image_string.to_s
   urls = image_string.split("\"")
   urls = urls[5].to_s
  end
end


# def get_images (album_name)
#   RSpotify.authenticate("5d6d6aee639f4c6ea5bb73e642ee54a3", "f2331f75e56a4cd2b64ef68c0a489fe3")
#   album = RSpotify::Album.search(album_name)
#   album = album.to_s
#   urls = album.split("=>")
#   urls = urls[5].to_s
#   urls = urls.split("\"")
#   urls = urls[1].to_s
# end