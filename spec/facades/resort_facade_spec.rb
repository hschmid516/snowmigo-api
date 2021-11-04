require 'rails_helper'

describe ResortFacade, :vcr do
  it 'gets resort info' do
    resorts = ResortFacade.get_resorts_by_state('co')

    expect(resorts.first.id).to eq('303001')
    expect(resorts.size).to eq(35)
    expect(resorts).to be_an Array
  end
end
