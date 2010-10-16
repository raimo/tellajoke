class JokesController < ApplicationController

  def index
    @best_jokes = Joke.all(:conditions => ['created_at BETWEEN ? AND ?', Date.today.beginning_of_week, Date.today.end_of_week], :order => 'points desc')
    @new_jokes = Joke.all(:conditions => ['created_at BETWEEN ? AND ?', Date.today.beginning_of_week, Date.today.end_of_week])
    @week = Date.today.cweek
  end

  def hotlist
    index
    render :partial => 'hotlist'
  end

  def show
    @joke = Joke.find(params[:id])
    unless @joke.to_param == params[:id]
      raise ActionController::RoutingError.new('Not found')
    end
  end

  def new
    @joke = Joke.new
  end

  def create
    @joke = Joke.new(params[:joke])

    if @joke.save
      redirect_to(jokes_path, :notice => 'Joke was successfully told.')
    else
      render :action => "new"
    end
  end

end
