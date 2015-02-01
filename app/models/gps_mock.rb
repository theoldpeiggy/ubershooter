class GpsMock < ActiveRecord::Base

  def initialize(attributes={})
    #create mock gps coordinates
    #create one line first
    #start: 43.659874, -79.39042 finish: 43.660797, -79.385834
    super

    #FIRST

    total_steps = 0

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

    for i in total_steps + 1..@steps - 1
      @lat_arr << @lat_arr[i - 1] + step_lat
      @long_arr << @long_arr[i - 1] + step_long
    end

    total_steps += @steps

    #SECOND

    start_lat = 43.659874
    start_long = -79.39042
    end_lat = 43.660797
    end_long = -79.385834

    time = 30000
    frame = 200
    @steps = time/frame

    step_lat = (end_lat - start_lat)/@steps
    step_long = (end_long - start_long)/@steps

    @lat_arr << start_lat
    @long_arr << start_long

    for i in total_steps + 1..total_steps + @steps - 1
      @lat_arr << @lat_arr[i - 1] + step_lat
      @long_arr << @long_arr[i - 1] + step_long
    end

    total_steps += @steps

    #THIRD

    start_lat = 43.659874
    start_long = -79.39042
    end_lat = 43.660797
    end_long = -79.385834

    time = 30000
    frame = 200
    @steps = time/frame

    step_lat = (end_lat - start_lat)/@steps
    step_long = (end_long - start_long)/@steps

    @lat_arr << start_lat
    @long_arr << start_long

    for i in total_steps + 1..total_steps + @steps - 1
      @lat_arr << @lat_arr[i - 1] + step_lat
      @long_arr << @long_arr[i - 1] + step_long
    end

    total_steps += @steps

    #FOURTH

    start_lat = 43.659874
    start_long = -79.39042
    end_lat = 43.660797
    end_long = -79.385834

    time = 30000
    frame = 200
    @steps = time/frame

    step_lat = (end_lat - start_lat)/@steps
    step_long = (end_long - start_long)/@steps

    @lat_arr << start_lat
    @long_arr << start_long

    for i in total_steps + 1..total_steps + @steps - 1
      @lat_arr << @lat_arr[i - 1] + step_lat
      @long_arr << @long_arr[i - 1] + step_long
    end

    total_steps += @steps



    for i in 0..total_steps - 1
      @lat_arr[i] = '%.6f' % @lat_arr[i]
      @long_arr[i] = '%.6f' % @long_arr[i]
    end

    update_attributes(lat_arr_str: @lat_arr.join(' '), long_arr_str: @long_arr.join(' '))
    #update_attributes(lat_arr_str: "43.663681 43.663691", long_arr_str: "-79.395149 -79.395159")
  end


  def lat_arr
    lat_arr_str.split(' ').map(&:to_f)
  end

  def long_arr
    long_arr_str.split(' ').map(&:to_f)
  end

  def step
    new_index = (step_index >= 150 * 4 - 1 ? 0 : step_index + 1)
    update_attributes(step_index: new_index)
  end
end
