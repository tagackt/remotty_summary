class HomeController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @timeline, @last_commented_at = @user.timeline(params[:from])
    end
  end
end
