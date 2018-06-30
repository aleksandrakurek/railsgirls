class EntriesController < ApplicationController
  def index
    @entries = Entry.all.order(date: :desc)
  end

  def new
    @entry = Entry.new
  end

  def create
    par = params.require(:entry)
    @entry = Entry.new(par.permit(:title, :contents))
    @entry.date = Date.today

    if @entry.save
      redirect_to action: :index

    else
      render :new
    end
  end

  def update
    @entry = Entry.find(params[:id])
    par = params.require(:entry)
    if @entry.update(par.permit(:title, :contents))
      redirect_to action: :index
    else
      render :edit
    end

  end

  def edit
    @entry = Entry.find(params[:id])

  end

  def destroy
    @entry = Entry.find(params[:id]).destroy

    flash[:info] = "Entry was destroyed"

    redirect_to action: :index
  end


end
