class RidesController < ApplicationController
  def new
    @ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    go_on_ride(@ride)
    redirect_to user_path(current_user)
  end

end
