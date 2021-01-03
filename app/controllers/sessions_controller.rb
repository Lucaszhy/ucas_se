class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # if user.activated?
        forwarding_url = session[:forwarding_url]
        reset_session
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        log_in user
        redirect_to forwarding_url || user
      # else
      #   message  = "账户未激活"
      #   message += "请查看您注册使用的邮箱内新邮件点击激活"
      #   flash[:warning] = message
      #   redirect_to root_url
      #   flash.now[:danger] = 'Invalid email/password combination'
      #   render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
