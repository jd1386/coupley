class AlbumsController < ApplicationController

def index
	@posts = Post.all
end

end
