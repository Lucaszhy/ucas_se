class ApplicationController < ActionController::Base
  include SessionsHelper

  private

    # Confirms a logged-in user.111
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "请登录账号"
        redirect_to login_url
      end
    end
end
