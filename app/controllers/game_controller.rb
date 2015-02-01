class GameController < ApplicationController
  respond_to :json, only: [:ledOn, :ledOff]

  #This is going to be the default page for the application, used for EVERYTHING
  def play

  end

  def ledOn
    edison = Edison.new
    edison.ledOn
    respond_with success: true
  end

  def ledOff
    edison = Edison.new
    edison.ledOff
    respond_with success: true
  end
end
