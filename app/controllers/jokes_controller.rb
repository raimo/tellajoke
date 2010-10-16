class JokesController < ApplicationController

  def index
    @jokes = Joke.all
  end

  def show
    @joke = Joke.find(params[:id])
  end

  def new
    @joke = Joke.new
  end

  def create
    @joke = Joke.new(params[:joke])

    if @joke.save
      redirect_to(@joke, :notice => 'Joke was successfully told.')
    else
      render :action => "new"
    end
  end

end
