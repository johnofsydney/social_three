class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update blog_params
  end

  def new
    @blog = Blog.new
  end

  def create
    blog = Blog.new(blog_params)
    blog.user_id = current_user.id
    if blog.save
      redirect_to blog
    else
      redirect_to root_path
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
  end

  private
  def blog_params
    params.require(:blog).permit(:content)
  end
end
