class JokesController < ApplicationController

  def index
    fetch_hotlist
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
