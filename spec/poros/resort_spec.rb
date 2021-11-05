require 'rails_helper'

RSpec.describe 'Resort Poro' do
  describe 'Poro & attributes' do
    it 'has attributes' do
      resort = Resort.new(resort_info)

      expect(resort).to be_a Resort
      expect(resort.name).to eq('Arapahoe Basin')
      expect(resort.id).to eq('303001')
    end

    it 'can include additional resort data and weather data' do
      resort = Resort.new(resort_info, weather_info)

      expect(resort).to be_a Resort
      expect(resort.name).to eq('Arapahoe Basin')
      expect(resort.id).to eq('303001')
      expect(resort.new_snow).to eq('3')
      expect(resort.base_depth).to eq('21')
      expect(resort.open_trails).to eq('1/147')
      expect(resort.open_lifts).to eq('1/9')
      expect(resort.snow_condition).to eq('Machine Groomed')
      expect(resort.mask_required).to eq('1')
      expect(resort.trail_map).to eq("http://feeds.snocountry.net/trailmapDisplay.php?permcode=303001")
      expect(resort.logo).to eq("http://snocountry.com/ski_area_logos/303001logo.jpg")
      expect(resort.chance_of_snow).to eq('0')
      expect(resort.hourly_weather).to eq({
        afternoon: { snowfall: nil,
                     temp: "42",
                     weather: "Sunny",
                     weather_icon: "http://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png",
                     wind: "2" },
        morning: { snowfall: nil,
                   temp: "39",
                   weather: "Sunny",
                   weather_icon: "http://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png",
                   wind: "3" },
        noon: { snowfall: nil,
                temp: "43",
                weather: "Sunny",
                weather_icon: "http://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png",
                wind: "4" } })
    end
  end
end
