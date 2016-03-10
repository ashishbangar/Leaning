class PostsController < ApplicationController
  
  def new  
    @post = Post.new
  end

  def create
    @post = Post.new(post_param)
    #@post.save
    if @post.save
       redirect_to @post
    else
       render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    redirect_to "http://localhost:3000/posts"
  end
 
  def index
    @posts = Post.all    
  end


  def edit
    @post = Post.find(params[:id])
  end


  def update
  @post = Post.find(params[:id])
 
    if @post.update(post_param)
      redirect_to @post
    else
      render 'edit'
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
   redirect_to posts_path
  end
    
  private 
    def post_param
      params.require(:post).permit(:title, :text)
    end

end
