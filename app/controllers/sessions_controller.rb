require 'rpx'

class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]


  def new
    session[:return_url] = params[:return_url] unless params[:return_url].nil?
  end

  def create
    rpx = Rpx::RpxHelper.new('d2ddd35ee36abe7b494ad8dd684d1c4275d422c0',
                  'https://rpxnow.com',
                  'tellajoke.rpxnow.com')
    resp = rpx.auth_info(params[:token])
    p resp
    if resp and resp['identifier']
      session[:user] = resp
      flash[:notice] = "You logged in as #{resp['preferredUsername']} successfully!"
      if session[:return_url]
        return_url = session[:return_url]
        session[:return_url] = nil
        redirect_to return_url
      else
        redirect_to root_path
      end
    else
      render :action => 'new'
    end
    
  end

  def delete
    reset_session
    flash[:notice] = "You logged out successfully!"
    redirect_to root_path
  end
end
