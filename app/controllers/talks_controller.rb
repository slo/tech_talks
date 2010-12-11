class TalksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @talks = Talk.find :all
  end
  
  def show
    @talk = Talk.find(params[:id])
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(params[:talk])
    @talk.user = current_user
    if @talk.save
      redirect_to talk_path(@talk)
    else
      render :action => :new
    end
  end

  def edit
    @talk = Talk.find(params[:id])
  end
  
  def update
    @talk = Talk.find(params[:id])
    @talk.update_attributes(params[:talk])
    if @talk.save
      redirect_to talk_path(@talk)
    else
      render :action => :edit
    end
  end

  def destroy
    @talk = Talk.find(params[:id])
    @talk.destroy
    redirect_to talks_path
  end
end
