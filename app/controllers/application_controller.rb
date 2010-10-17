class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def merge_teller(paramhash)
    if session[:user]
      paramhash.merge!(:teller => session[:user]['preferredUsername'])
    end
  end


  def fetch_hotlist
    @best_jokes = Joke.all(:conditions => ['created_at BETWEEN ? AND ?', Time.now.beginning_of_week, Time.now.end_of_week], :order => 'points desc', :limit => Joke::MAX_COUNT)
    @new_jokes = Joke.all(:conditions => ['created_at BETWEEN ? AND ?', Time.now.beginning_of_week, Time.now.end_of_week], :order => 'created_at desc', :limit => Joke::MAX_COUNT)
    @week = Date.today.cweek
  end
end
