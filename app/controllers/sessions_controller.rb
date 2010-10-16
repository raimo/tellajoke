require 'rpx'

class SessionsController < ApplicationController
  extend Rpx

  def new
  end

  def create
    rpx = RpxHelper.new('d2ddd35ee36abe7b494ad8dd684d1c4275d422c0',
                  'https://rpxnow.com',
                  'tellajoke.rpxnow.com')
    resp = rpx.auth_info(params[:token])
    if resp and resp[:identifier]
      flash[notice] = "You logged in as #{resp[:preferredUsername]} successfully!"
      redirect_to root_path
    else
      render :action => 'new'
    end
    
  end
end
