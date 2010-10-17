class CommentsController < ApplicationController
  before_filter :fetch_joke

  def create
    @comment = @joke.comments.create(params[:comment])
    if @comment.valid?
      render :partial => 'comment', :object => @comment
    else
      flash.now[:error] = "Please type the message content"
      render :partial => 'comment', :object => @comment, :status => 203
    end
  end

  private

  def fetch_joke
    @joke = Joke.find(params[:joke_id])
  end
end
