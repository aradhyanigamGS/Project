class HomeController < ApplicationController
  def index
    # byebug
    
    if register_signed_in?
      @register = Register.find_by(session[:login_session_id])
    end

  end

end
