class PostsController < ApplicationController
before_action :require_signin
before_action :set_post, except: [:index, :new, :create]


def index
	@posts = Post.all
	@post = Post.new
	@reply = Reply.new
end

def show
	@replies = @post.replies
end

def new
	@post = Post.new
end

def create
	@post = Post.new(post_params)
	@post.user = current_user
	if @post.save
		redirect_to posts_path
		notice = "Successfully created!"
	else
		render :new
	end
end

def edit
end

def update
	if @post.update(post_params)
		redirect_to posts_path
		notice = "Successfully edited!"
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
		params.require(:post).permit(:content, :image)
	end

	def set_post
		@post = Post.find(params[:id])
	end

	def require_signin
		redirect_to root_url unless user_signed_in?
	end

end
