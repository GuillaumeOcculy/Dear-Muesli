module Admin
  class AdminController < ApplicationController
    before_action :require_admin

    def dashboard
    end

    private
    def require_admin
      unless current_user.is_admin
        flash[:danger] = "T'es pas admin bitch"
        redirect_to root_path
      end
    end
  end
end