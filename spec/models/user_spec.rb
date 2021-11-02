require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:trips) }
  it { should have_many(:friends).class_name('User') }
  it { should have_many(:friends).through(:friendships) }
end
