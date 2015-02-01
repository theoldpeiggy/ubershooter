class Edison < ActiveRecord::Base
  require 'net/http'
  require 'uri'
  ENDPOINT = 'http://138.51.180.204:1337'

  def get(path)
    uri = URI.parse(ENDPOINT + path)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response
  end

  def hit
    get("/hit")
  end
end
