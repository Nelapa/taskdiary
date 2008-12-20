class UsersController < ApplicationController
  
  def new
    @user = User.new  
  end
  
  def create
    @password = params[:user]
    @user = User.new params[:user]
    @user.crypted_password = @user.password.crypt(User::PASSWORD_SALT)
    if @user.save
      flash[:notice] = 'Thanks for registration!'
      redirect_to tasks_path
    else
      flash[:error] = 'Registration error!'
      render :action => :new
    end
  end
  
    def login
    if params[:user]
      login = params[:user][:login]
      password = params[:user][:password]
      @user = User.find_by_login(login)
      if @user and password.crypt(User::PASSWORD_SALT) == @user.crypted_password
        flash[:notice] = "Welcome, #{@user.login}!"
        session[:user_id] = @user.id
        redirect_to tasks_path
      else
        flash[:error] = 'Illegal login or password'
        render :action => :login
      end
    else
      @user = User.new
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = 'You have successfully logged out'
    redirect_to tasks_path
  end
  
end
