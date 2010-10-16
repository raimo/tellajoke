class VotesController < ApplicationController
  def cast
    if Joke.find(params[:joke_id]).votes.create(:ip => request.remote_ip)
      flash[:notice] = 'Your vote was cast successfully!'
    else
      flash[:error] = 'Sorry, you can vote only once a day.'
    end

    fetch_hotlist
    render :partial => 'jokes/hotlist'
  end
end
