class PostsController < ApplicationController
before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
	end
	def new
    @post = Post.new
end

def create
    @post = Post.new post_params
    if @post.save
			redirect_to @post, notice: "Your article was saved"
		else
			render 'new', notice: "Problem! I was unable to save your post."
		end
end  

def post_params
		params.require(:post).permit(:title, :content, :slug)
	end	
	
def find_post
		@post = Post.friendly.find(params[:id])
	end

end
