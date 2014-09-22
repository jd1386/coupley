class RepliesController < ApplicationController
before_action :set_post

def index
	
end

def new
	
end

def create
#	post = Post.find(params[:post_id])
	@new_reply = @post.replies.build(reply_params)
	@new_reply.user = current_user
	
	respond_to do |format|
		if @new_reply.save
			format.html { redirect_to posts_path }
			format.json { render json: @new_reply, status: :created, location: @new_reply }
			format.js
		else
			format.html { render :new }
			format.json { render json: @new_reply.errors, status: :unprecessable_entity }
			format.js
		end
	end
end

def destroy
	@new_reply.destroy
	redirect_to posts_path
	notice = "Successfully deleted!"
end


private

	def reply_params
		params.require(:reply).permit(:content, :user_id, :post_id)
	end

	def set_post
		@post = Post.find(params[:post_id])
	end

end
