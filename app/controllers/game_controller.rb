class GameController < ApplicationController
  respond_to :json, only: :hit

  #This is going to be the default page for the application, used for EVERYTHING
  def play

  end

  def hit
    edison = Edison.new
    edison.hit
    respond_with success: true
  end
end
