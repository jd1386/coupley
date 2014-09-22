class PostsController < ApplicationController
before_action :require_signin
before_action :set_post, except: [:index, :new, :create]


def index
	case params[:scope]
		when "has_photos"
			@posts = Post.has_photos
		when "has_link"
			@posts = Post.has_link
		else
			@posts = Post.paginate(:page => params[:page], :per_page => 10)
	end

	@post = current_user.posts.build
	@new_reply = @post.replies.build
end


def create
	@post = current_user.posts.build(post_params)

	if @post.save
		redirect_to posts_path, notice: "Post created." 
	else
		render :new	
	end
end

def edit
end

def update
	if @post.update(post_params)
		redirect_to posts_path, notice: "Successfully edited!"
	else
		render :edit
	end
end

def destroy
	@post.destroy
	redirect_to posts_path
	notice = "Successfully deleted!"
end

private
	
	def post_params
		params.require(:post).permit(:title, :content, :link, :image)
	end

	def set_post
		@post = Post.find(params[:id])
	end


	def require_signin
		redirect_to root_url unless user_signed_in?
	end

end
