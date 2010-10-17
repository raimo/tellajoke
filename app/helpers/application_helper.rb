module ApplicationHelper

  def current_teller
    if session[:user]
      session[:user]['preferredUsername']
    else
      link = if @joke.new_record?
               new_joke_path(:new_comment => true)
             else
               joke_path(@joke, :new_comment => true)
             end
      return "Anonymous (Click #{link_to('here', new_session_path(:return_url => link))} to login)".html_safe
    end
  end
end
