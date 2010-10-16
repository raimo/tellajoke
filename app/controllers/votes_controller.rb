class VotesController < ApplicationController
  def cast
    vote = Joke.find(params[:joke_id]).votes.create(:ip => request.remote_ip)
    if vote.valid?
      flash.now[:notice] = 'Your vote was cast successfully!'
    else
      flash.now[:error] = 'Sorry, you can vote only once a day.'
    end

    fetch_hotlist
    render :partial => 'jokes/hotlist'
  end
end
