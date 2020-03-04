class PostController < ApplicationController
  before_action :varify_user
  def index
  end
  def mypage
    @user_id=params[:user_id]
    @posts=Post.where(user_id:@user_id)
    @user=User.find_by(id:@user_id)
    #@post2=Post.find_by(user_id:@user_id)
    @name=@user.name
  end
  def timeline
	  @posts=Post.all
  end
  def newpost
  end
  def show
	  @id=params[:id]
    @user_id=params[:user_id]
    @user=User.find_by(id:@user_id)
    @post=Post.find_by(id:@id)
    @name=@post.name
  end
  def create
    @post=Post.new(name:@current_user.name,content:params[:content],user_id:@current_user.id)
    @post.save
    redirect_to("/timeline")    
  end
  def edit
    @id=params[:id]
    @post=Post.find_by(id:@id)
  end
  def save
    @id=params[:id]
    @post=Post.find_by(id:@id)
    @post.content=params[:content]
    if @post.save
      flash[:notice]="投稿が編集されました"
      redirect_to("/timeline")
    else
      #render("/#{@post.name}/#{@id}/edit")
      render(action: :edit)
    end
  end
  def confirm
    @id=params[:id]
    @post=Post.find_by(id:@id)
  end
  def delete
    @id=params[:id]
    @post=Post.find_by(id:@id)
    @post.destroy
    redirect_to("/timeline")
  end
end
