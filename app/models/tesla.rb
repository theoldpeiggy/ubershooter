class Tesla < ActiveRecord::Base
  require 'net/http'
  require 'uri'
  ENDPOINT = 'http://private-anon-32e1816f4-timdorr.apiary-mock.com'

  def authenticate(username, password)
    contents = "user_session%5Bemail%5D=#{username}&user_session%5Bpassword%5D=#{password}"
    uri = URI.parse(ENDPOINT + "/login")
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
    request.body = contents

    response = http.request(request)
  end

  def vehicle
    @vehicle
  end

  def id
    @id
  end

  def select_vehicle(id)
    @id = id
  end

  def get_vehicles
    JSON.parse get('/vehicles').body
  end

  def get_login
    get('/login').body
  end

  def get_vehicle
    get_vehicles.first
  end

  def get_mobile_enabled
    JSON.parse get("/vehicles/#{@id}/mobile_enabled").body
  end

  def get_charge_state
    JSON.parse get_command("/charge_state").body
  end

  def get_climate_state
    JSON.parse get_command("/climate_state").body
  end

  def get_drive_state
    JSON.parse get_command("/drive_state").body
  end

  def get_gui_settings
    JSON.parse get_command("/gui_settings").body
  end

  def get_vehicle_state
    JSON.parse get_command("/vehicle_state").body
  end

  def set_open_charge_port
    JSON.parse(get_command("/charge_port_door_open").body)["result"]
  end

  def set_charge_standard
    JSON.parse(get_command("/charge_standard").body)["result"]
  end

  def set_charge_max_range
    JSON.parse(get_command("/charge_max_range").body)["result"]
  end

  def set_charge_limit(limit)
    JSON.parse(get_command("/set_charge_limit?percent=#{limit}").body)["result"]
  end

  def set_charge_start
    JSON.parse(get_command("/charge_start").body)["result"]
  end

  def set_charge_stop
    JSON.parse(get_command("/charge_stop").body)["result"]
  end

  def set_flash_lights
    JSON.parse(get_command("/flash_lights").body)["result"]
  end

  def set_honk_horn
    JSON.parse(get_command("/honk_horn").body)["result"]
  end

  def set_door_unlock
    JSON.parse(get_command("/door_unlock").body)["result"]
  end

  def set_door_lock
    JSON.parse(get_command("/door_lock").body)["result"]
  end

  def set_temps(driver_temp, passenger_temp)
    JSON.parse(get_command("/set_temps?driver_temp=#{driver_temp}&passenger_temp=#{passenger_temp}").body)["result"]
  end

  def set_auto_conditioning_start
    JSON.parse(get_command("/auto_conditioning_start").body)["result"]
  end

  def set_auto_conditioning_stop
    JSON.parse(get_command("/auto_conditioning_stop").body)["result"]
  end

  def set_sun_roof_control(state)
    JSON.parse(get_command("/sun_roof_control?state=#{state}").body)["result"]
  end

  private

  def initialize
    @vehicle = get_vehicle
    @id = @vehicle["id"]
  end

  def get(path)
    uri = URI.parse(ENDPOINT + path)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response
  end

  def get_command(path)
    get("/vehicles/#{@id}/command" + path)
  end
end
