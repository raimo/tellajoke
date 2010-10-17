class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_teller

  protected

  def merge_teller(paramhash)
    if session[:user]
      paramhash.merge!(:teller => session[:user]['preferredUsername'])
    end
  end

  def current_teller
    if session[:user]
      session[:user]['preferredUsername']
    else
      "Anonymous (Click <a href='#{new_session_path}'>here</a> to login)".html_safe
    end
  end


  def fetch_hotlist
    @best_jokes = Joke.all(:conditions => ['created_at BETWEEN ? AND ?', Time.now.beginning_of_week, Time.now.end_of_week], :order => 'points desc', :limit => Joke::MAX_COUNT)
    @new_jokes = Joke.all(:conditions => ['created_at BETWEEN ? AND ?', Time.now.beginning_of_week, Time.now.end_of_week], :order => 'created_at desc', :limit => Joke::MAX_COUNT)
    @week = Date.today.cweek
  end
end
