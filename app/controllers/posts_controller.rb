class PostsController < ApplicationController

  def index
    if params[:author_id] # if this is reached via a nested route example: /authors/1/posts
      @posts = Author.find(params[:author_id]).posts # @posts will be only the collection of posts pertaining to that author
    else
      @posts = Post.all # @posts will be ALL posts
    end
  end

  def show # no change for nested resource needed here, /authors/:id/posts/:id and /posts/:id will render t he same information
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

private

  def post_params
    params.require(:post).permit(:title, :desription, :post_status, :author_id)
  end
end
