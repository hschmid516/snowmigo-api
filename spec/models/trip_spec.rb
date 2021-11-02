require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should have_many(:resort_options) } 
end
