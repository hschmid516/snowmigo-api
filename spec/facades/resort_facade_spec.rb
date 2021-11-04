require 'rails_helper'

describe ResortFacade, :vcr do
  it 'gets resort info' do
    resorts = ResortFacade.get_resorts

    expect(resorts.first.id).to eq(1)
  end
end
