class Resort
  attr_reader :id,
              :name,
              :new_snow,
              :base_depth,
              :open_trails,
              :open_lifts,
              :snow_condition,
              :mask_required,
              :trail_map,
              :logo

  def initialize(ski_info, weather_info = nil)
    @id = ski_info[:id]
    @name = ski_info[:resortName]
    @new_snow = ski_info[:newSnowMin]
    @base_depth = ski_info[:avgBaseDepthMin]
    @open_trails = "#{ski_info[:openDownHillTrails]}/#{ski_info[:maxOpenDownHillTrails]}"
    @open_lifts = "#{ski_info[:openDownHillLifts]}/#{ski_info[:maxOpenDownHillLifts]}"
    @snow_condition = ski_info[:primarySurfaceCondition]
    @mask_required = ski_info[:covidMaskRequired]
    @trail_map = ski_info[:lgTrailMapURL]
    @logo = ski_info[:logo]
    @weather = weather_info
  end


  def chance_of_snow
    @weather.first[:chanceofsnow]
  end

  def hourly_weather
    {
      morning: {
        temp: @weather.first[:hourly][3][:mid].first[:tempF],
        weather: @weather.first[:hourly][3][:mid].first[:weatherDesc].first[:value],
        weather_icon: @weather.first[:hourly][3][:mid].first[:weatherIconUrl].first[:value],
        wind: @weather.first[:hourly][3][:mid].first[:windspeedMiles],
        snowfall: @weather.first[:hourly][3][:mid].first[:snowfall_cm]
      },
      noon: {
        temp: @weather.first[:hourly][4][:mid].first[:tempF],
        weather: @weather.first[:hourly][4][:mid].first[:weatherDesc].first[:value],
        weather_icon: @weather.first[:hourly][4][:mid].first[:weatherIconUrl].first[:value],
        wind: @weather.first[:hourly][4][:mid].first[:windspeedMiles],
        snowfall: @weather.first[:hourly][4][:mid].first[:snowfall_cm]
      },
      afternoon: {
        temp: @weather.first[:hourly][5][:mid].first[:tempF],
        weather: @weather.first[:hourly][5][:mid].first[:weatherDesc].first[:value],
        weather_icon: @weather.first[:hourly][5][:mid].first[:weatherIconUrl].first[:value],
        wind: @weather.first[:hourly][5][:mid].first[:windspeedMiles],
        snowfall: @weather.first[:hourly][5][:mid].first[:snowfall_cm]
      }
    }
  end
end
