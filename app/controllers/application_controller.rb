class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def merge_teller(paramhash)
    if session[:user]
      paramhash.merge!(:teller => session[:user]['preferredUsername'])
    end
  end


  def fetch_hotlist
    @best_jokes = Joke.all(:conditions => ['created_at BETWEEN ? AND ?', 1.week.ago, Time.now], :order => 'points desc', :limit => Joke::MAX_COUNT)
    @new_jokes = Joke.all(:conditions => ['created_at BETWEEN ? AND ?', 1.week.ago, Time.now], :order => 'created_at desc', :limit => Joke::MAX_COUNT)
    @week = Date.today.cweek
  end
end
