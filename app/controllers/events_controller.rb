class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :new]

  def index
  end

  def show
  	@event = Event.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
  	@event = Event.new(title: params[:title], start_date: params[:start_date], duration: params[:duration], description: params[:description], price: params[:price].to_i, location: params[:location], admin: current_user)

  	if @event.save
      flash[:success] = "Evénement bien créé !"
      redirect_to event_path(@event.id)
  	else
      render :new
      flash[:danger] = @event.errors.messages
  	end
  end
end
