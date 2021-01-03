class ResetpasswordController < ApplicationController
  def reset

    #如果该对象的密保问题回答正确
    if User.where(email: params[:email]).first.answer == params[:newAnswer]
      #才查找该对象,User.where查出来的是对象集合
      @user = User.where(email: params[:email]).first
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                 BCrypt::Engine.cost
      #修改密码
      @user.password_digest = BCrypt::Password.create(params[:password_digest], cost: cost)
      @user.save

      #如果该对象的密保问题回答错误，提示错误。且不在新界面显示对象信息。
    else
      flash[:success] = "密保问题回答错误，请返回上一页重新找回!"
    end
  end


  def index


  end

end
