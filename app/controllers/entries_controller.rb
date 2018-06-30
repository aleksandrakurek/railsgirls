class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create


    par = params.require(:entry)
    @entry =  Entry.new(par.permit(:title, :contents))
    @entry.date = Date.today

    if @entry.save
      redirect_to action: :index

    else
      render :new
    end
  end

end
