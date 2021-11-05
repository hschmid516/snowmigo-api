require 'rails_helper'

describe ResortFacade, :vcr do
  it 'gets resort info' do
    resorts = ResortFacade.resorts_by_state('co')

    expect(resorts.first.id).to eq('303001')
    expect(resorts.size).to eq(35)
    expect(resorts).to be_an Array
  end

  it 'gets resorts by id' do
    resorts = ResortFacade.resorts_by_id(303001)

    expect(resorts.first.id).to eq('303001')
    expect(resorts.size).to eq(1)
    expect(resorts).to be_an Array
  end
end
