class ResortService
  class << self
    SNO_URL = "http://feeds.snocountry.net/getSnowReport.php?apiKey=#{ENV['SNO_KEY']}&"
    def get_resorts_by_state(state)
      ResortsClient.get_data("#{SNO_URL}states=#{state}")[:items]
    end
  end
end
