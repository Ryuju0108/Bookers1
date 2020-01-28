class BlogsController < ApplicationController
  def index
  	@blogs = Blog.all
  	@blog = Blog.new
  end

  def show
  	@blog = Blog.find(params[:id])
  end

  def edit
  	@blog = Blog.find(params[:id])
  end

  def update
  	blog = Blog.find(params[:id])
  	if blog.update(blog_params)
  		flash[:notice_update] = "Book was successfully updated."
  		redirect_to blog_path(blog)
  	else
  		render("edit_blog_path(blog)")
  	end
  end

  def new
  end

  def create
  	blog = Blog.new(blog_params)
  	if blog.save
  		flash[:create] = "Book was successfully created."
  		redirect_to blogs_path
  	else
  		render("/blogs")
  	end
  end

  def destroy
  	blog = Blog.find(params[:id])
  	if blog.destroy
  		flash[:notice_destroy] = "Book was successfully destroyed."
  		redirect_to blogs_path
  	end
  end

  private
  def blog_params
  	params.require(:blog).permit(:title, :body)
  end
end
