class GameController < ApplicationController
  respond_to :json, only: [:hit, :get_target]

  #This is going to be the default page for the application, used for EVERYTHING
  def play

  end

  def hit
    edison = Edison.new
    edison.hit
    respond_with success: true
  end

  def get_target
    respond_with success: true, latitude: 43.663681, longitude: -79.395149
  end
end
