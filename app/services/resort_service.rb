class ResortService
  extend StateAbbrToName

  class << self
    SNO_URL = "http://feeds.snocountry.net/getSnowReport.php?apiKey=#{ENV['SNO_KEY']}&"

    def resorts_by_state(state)
      ResortsClient.get_data("#{SNO_URL}states=#{state}")[:items]
    end

    def resorts_by_id(ids)
      ResortsClient.get_data("#{SNO_URL}ids=#{ids}")[:items]
    end

    def weather(resort, state)
      lat_long = find_lat_long(resort, state)
      ResortsClient.get_data("http://api.worldweatheronline.com/premium/v1/ski.ashx?key=#{ENV['WEATHER_KEY']}&q=#{lat_long}&format=json")[:data][:weather]
    end

    private

    def find_lat_long(resort, state)
      results = Geocoder.search("#{resort}, #{abbr_to_name[state]}")
      "#{results.first.coordinates[0]},#{results.first.coordinates[1]}"
    end
  end
end
