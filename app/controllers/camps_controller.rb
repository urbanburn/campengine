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

  # Display a camp and its users
  def show
    @camp = Camp.find(params[:id])
    @users = @camp.users
  end

=begin
  # Haven't gotten to really implementing this yet.
  # For a user to join a camp.
  def join
    # Get ID from post request.
    id = camp_params[:id]
    byebug
  end
=end

  private

  def camp_params
    params.require(:camp).permit!
  end

end
