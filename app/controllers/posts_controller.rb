class PostsController < ApplicationController
  before_action :user_logged_in, only: [:create, :vote]

  def new
    @post = Post.new
  end

  def vote
    value = params[:type] == "like" ? 1 : 0
    @post = Post.find(params[:id])
    @post.add_or_update_evaluation(:votes, value, current_user)
    flash[:notice] = "Feedback received."
    redirect_back fallback_location: root_path
  end

  def create
    @post = current_user.posts.build(post_params)
    RSpotify.authenticate("5d6d6aee639f4c6ea5bb73e642ee54a3", "f2331f75e56a4cd2b64ef68c0a489fe3")
    artists = RSpotify::Artist.search(@post.artist, limit: 1, market: 'US')
    if artists.empty?
      flash[:danger] = "The artist you entered does not exist (at least in Spotify's database)."
      render 'new'
    else
      # creating new artist object if it doesn't exist
      if Artist.where(spotify_id: artists[0].id).blank?
        @new_artist = Artist.create(spotify_id: artists[0].id)
      else
        @new_artist = Artist.find_by(spotify_id: artists[0].id)
      end
      albums = artists[0].albums(album_type: 'album,single',country: 'US')
      albumnames = albums.map(&:name)
      index = albumnames.map(&:downcase).index(@post.album.downcase)
      if index.nil?
        flash[:danger] = "This artist does not have the album that you entered (at least in Spotify's database)."
        render 'new'
      else
        # @post.artistid = artists[0].id
        # @post.albumid = albums[index].id    # how to add these ID's to the @post object???
        @post.artist_id = @new_artist.id
        @post.artist = artists[0].name
        @post.album = albums[index].name
        if @post.save
          flash[:success] = "Post created!"
          redirect_to user_url(current_user.id)
        else
          flash[:danger] = "Posting errors"
          render 'new'
        end
      end
    end

  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :artist, :album)
    end
end
