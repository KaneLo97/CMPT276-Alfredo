#app/controllers/artists_controller.rb
class ArtistsController < ApplicationController
 helper_method :images_url
 def index
   RSpotify.authenticate("5d6d6aee639f4c6ea5bb73e642ee54a3", "f2331f75e56a4cd2b64ef68c0a489fe3")
   if !params[:artist_name].empty?
     @artists = RSpotify::Artist.search(params[:artist_name])
   else
     redirect_to root_path
   end
 end
 def show
   @artist = RSpotify::Artist.find(params[:id])
   if Artist.exists?(spotify_id: @artist.id)
     @artist_db = Artist.find_by(spotify_id: @artist.id)
     @posts = @artist_db.posts.paginate(page: params[:page])
   end
 end
 def images_url (image_string)
  image_string = image_string.to_s
  urls = image_string.split("\"")
  urls = urls[5].to_s
 end
 def checkLength (albums)
  if (albums.length() > 0)
    check = true
  end
 end
 end
