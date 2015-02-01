class GpsMock < ActiveRecord::Base

  def initialize(attributes={})
    #create mock gps coordinates
    #create one line first
    #start: 43.659874, -79.39042 finish: 43.660797, -79.385834
    super

    start_lat = 43.659874
    start_long = -79.39042
    end_lat = 43.660797
    end_long = -79.385834

    time = 30000
    frame = 200
    @steps = time/frame

    step_lat = (end_lat - start_lat)/@steps
    step_long = (end_long - start_long)/@steps

    @lat_arr = Array.new
    @lat_arr << start_lat
    @long_arr = Array.new
    @long_arr << start_long

    for i in 1..@steps
      @lat_arr << @lat_arr[i - 1] + step_lat
      @long_arr << @long_arr[i - 1] + step_long
    end

    for i in 1..@steps
      @lat_arr[i] = '%.6f' % @lat_arr[i]
      @long_arr[i] = '%.6f' % @long_arr[i]
    end

    update_attributes(lat_arr_str: @lat_arr.join(' '), long_arr_str: @long_arr.join(' '))
  end


  def lat_arr
    lat_arr_str.split(' ').map(&:to_f)
  end

  def long_arr
    long_arr_str.split(' ').map(&:to_f)
  end

  def step
    new_index = step_index == @steps ? 0 : step_index + 1
    update_attributes(step_index: new_index)
  end
end
