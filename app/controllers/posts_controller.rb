class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
 
  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to @post
    else
      flash[:alert] = "You need an image to create a post."
      render :new
    end 
      
  end	

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      flash[:success] = "Post updated"
    else
      flash[:alert] = "Something is wrong with your form"
    end 
    redirect_to(post_path(@post))
  end

  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   if @post.destroy
     flash[:success] = "Post deleted"
   end
   redirect_to posts_path
  end
  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
