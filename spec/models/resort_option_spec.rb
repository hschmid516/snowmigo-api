require 'rails_helper'

RSpec.describe ResortOption, type: :model do
  it { should belong_to(:trip) } 
end
