class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(content: params[:content])
    if @post.save
      flash[:notice] ="投稿しました！"
      redirect_to posts_index_url
    else
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
    @post.content = params[:content]
      if @post.save
        flash[:notice] = "投稿を編集しました。"
        redirect_to posts_index_url
      else
        render :edit
      end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to posts_index_url
  end

end