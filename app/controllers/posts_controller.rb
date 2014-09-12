class PostsController < ApplicationController


def index
	@posts = Post.all
	@replies = Reply.all
	
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
	@post = Post.find(params[:id])
end

def update
	@post = Post.find(params[:id])
	if @post.update(post_params)
		redirect_to posts_path
		notice = "Successfully edited!"
	else
		render :edit
	end
end

def destroy
	@post = Post.find(params[:id])
	@post.destroy
	redirect_to posts_path
	notice = "Successfully deleted!"
end

private

	def post_params
		params.require(:post).permit(:content)
	end

end
