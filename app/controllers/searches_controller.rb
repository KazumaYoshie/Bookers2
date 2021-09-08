class SearchesController < ApplicationController

  def search
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:find], params[:word])
    else
     @books = Book.looks(params[:find], params[:word])
    end
  end
end
