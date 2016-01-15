class CampsController < ApplicationController

  def index
    @camps = Camp.all
  end

  def new
    @camp = Camp.new
  end

  def create
    Camp.create camp_params
    redirect_to camps_path
  end

  private

  def camp_params
    params.require(:camp).permit!
  end

end
