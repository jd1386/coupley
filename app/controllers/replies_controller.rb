class RepliesController < ApplicationController
before_action :set_post

def new
	@reply = Reply.new
end

def create
	@reply = @post.replies.new(reply_params)
	@reply.user = current_user
	@reply.post = @post
	
	if @reply.save
		redirect_to posts_path
		notice = "Reply successfully created!"
	else
		render :edit
		warning = "Oops! Something happened. Try again!"
	end
end


private

	def reply_params
		params.require(:reply).permit(:content)
	end

	def set_post
		@post = Post.find(params[:post_id])
	end

end
