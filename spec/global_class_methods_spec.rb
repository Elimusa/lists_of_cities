require "spec_helper"

describe ListsOfCities::GlobalClassMethods do
  it "shoud return all countries" do
    expect(ListsOfCities.countries.length).to_not be nil
  end

  it "shoud return a country which has code 1" do
    expect(ListsOfCities.country('1').code).to eq '1'
  end

  it 'shoud return all provinces under country(1)' do
    expect(ListsOfCities.provinces('1')).to_not be nil
  end

  it 'shoud return a province which has code 11 under country(1)' do
    expect(ListsOfCities.province('1', '11')).to_not be nil
  end

  let(:spiting){ ->{ListsOfCities.province('1', '1')} }
  it 'shoud raise a NotFound error' do
    expect(spiting).to raise_exception(ListsOfCities::ActiveRecord::NotFound)
  end
end
