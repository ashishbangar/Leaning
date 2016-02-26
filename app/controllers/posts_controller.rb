class PostsController < ApplicationController
	def new
		
	end
	def create
		@post = Post.new(post_param)
  		@post.save
  		redirect_to @post
		
	end
	private 
		def post_param
 			params.require(:post).permit(:title, :text)
		end
end
