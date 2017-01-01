require "spec_helper"

describe ListsOfCities::Association do

  let(:root){ListsOfCities::Root.new}
  let(:countries){root.countries.all}
  let(:country){root.countries.find_by(code: '1')}
  let(:provinces){country.provinces.all}
  let(:province){country.provinces.where(code: '23').first}
  let(:citis){province.cities.all}
  let(:city){province.cities.where(code: '1').first}
  let(:regions){city.regions.all}
  let(:region){city.regions.find_by(code: '2')}

  it "should be Association" do
    expect(root.countries.class).to eq(ListsOfCities::Association)
  end

  it "should return all countries" do
    expect(countries.class).to eq(ListsOfCities::DivisionList)
    expect(countries).to_not be_empty
  end

  it 'should return all provinces under country(1)' do
    expect(provinces.class).to eq(ListsOfCities::DivisionList)
    expect(provinces).to_not be_empty
  end

  it 'should return all citis under country(1).province(23)' do
    expect(citis.class).to eq(ListsOfCities::DivisionList)
    expect(citis).to_not be_empty
  end

  it 'should return all regions under country(1).province(23).city(1)' do
    expect(regions.class).to eq(ListsOfCities::DivisionList)
    expect(regions).to_not be_empty
  end

  it "should return a country which has code 1" do
    expect(country.code).to eq '1'
  end

  it 'should return a province which has code 23 under country(1)' do
    expect(province.code).to eq('23')
  end

  it 'should return a city which has code 1 under country(1).province(23)' do
    expect(city.code).to eq('1')
  end

  it 'should return a region which has code 2 country(1).province(23).city(1)' do
    expect(region.code).to eq('2')
  end

end