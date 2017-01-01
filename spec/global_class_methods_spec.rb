require "spec_helper"

describe ListsOfCities::GlobalClassMethods do
  context 'plural functions' do

    let(:countries){ListsOfCities.countries}
    it "should return all countries" do
      expect(countries.class).to eq(ListsOfCities::DivisionList)
      expect(countries).to_not be_empty
    end

    let(:provinces){ListsOfCities.provinces('1')}
    it 'should return all provinces under country(1)' do
      expect(provinces.class).to eq(ListsOfCities::DivisionList)
      expect(provinces).to_not be_empty
    end

    let(:citis){ListsOfCities.cities('1', '23')}
    it 'should return all citis under country(1).province(23)' do
      expect(citis.class).to eq(ListsOfCities::DivisionList)
      expect(citis).to_not be_empty
    end

    let(:regions){ListsOfCities.regions('1', '23', '1')}
    it 'should return all regions under country(1).province(23).city(1)' do
      expect(regions.class).to eq(ListsOfCities::DivisionList)
      expect(regions).to_not be_empty
    end

  end

  context 'singular functions' do

    it "should return a country which has code 1" do
      expect(ListsOfCities.country('1').code).to eq '1'
    end

    it 'should return a province which has code 23 under country(1)' do
      expect(ListsOfCities.province('1', '23').code).to eq('23')
    end

    it 'should return a city which has code 1 under country(1).province(23)' do
      expect(ListsOfCities.city('1', '23', '1').code).to eq('1')
    end

    it 'should return a region which has code 2 country(1).province(23).city(1)' do
      expect(ListsOfCities.region('1', '23', '1', '2').code).to eq('2')
    end

  end

  let(:spiting){ ->{ListsOfCities.province('1', '1')} }
  it 'should raise a NotFound error' do
    expect(spiting).to raise_exception(ListsOfCities::ActiveRecord::NotFound)
  end
end
