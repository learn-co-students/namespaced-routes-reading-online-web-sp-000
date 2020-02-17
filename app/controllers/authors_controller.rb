class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
  end

  def index
    @authors = Author.all
  end

end


#totally did something new.. Here it is. Good luck! Thanks!
