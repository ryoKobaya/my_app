class HomeController < ApplicationController
  def top
  end
  def register
  end
  def create
    @user=User.new(name:params[:name],mail:params[:mail],password:params[:password],image_name:"defalt_user.jpg")
    if @user.save
      session[:user_id]=@user.id
      flash[:notice]="#{@user.name}でログインしました"
      redirect_to("/#{@user.id}")
    else
      flash[:notice]="ユーザー名またはパスワードの入力が正しくありません"
      render(action: :register)
    end
  end
  def login_form
  end
  def login
    @user=User.find_by(mail:params[:mail],password:params[:password])
    if @user
      session[:user_id]=@user.id
      flash[:notice]="#{@user.name}でログインしました"
      redirect_to("/#{@user.id}")
    else
      flash[:notice]="ユーザー名またはパスワードが正しくありません"
      render(action: :login_form)
    end
  end
  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/login")
  end
  def edit_inf
  end
  def change
    @current_user.name=params[:name]
    @current_user.mail=params[:mail]
    @current_user.password=params[:password]
    if params[:image]
      @current_user.image_name="#{@current_user.id}.jpg"
      image=params[:image]
      File.binwrite("public/user_images/#{@current_user.image_name}",image.read)
    end
    if @current_user.save
      flash[:notice]="ユーザー情報を変更しました"
      redirect_to("/#{@current_user.id}")
    else
      #render("/#{@post.name}/#{@id}/edit")
      render(action: :edit_inf)
    end
  end
end
