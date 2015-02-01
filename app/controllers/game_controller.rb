class GameController < ApplicationController
  respond_to :json, only: [:get_target, :try_hit]

  #This is going to be the default page for the application, used for EVERYTHING
  def play

  end

  def try_hit
    edison = Edison.new
    num = rand(10)
    if num >= 5
      edison.hit
    else
      edison.miss
    end
    respond_with success: true
  end

  def get_target
    gps = GpsMock.first
    current_index = gps.step_index
    gps.step
    #respond_with success: true, latitude: 43.663681, longitude: -79.395149
    respond_with success: true, latitude: gps.lat_arr[current_index], longitude: gps.long_arr[current_index]
  end
end
