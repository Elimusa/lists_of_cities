require "spec_helper"

describe ListsOfCities::Query do
  it "should return a xpath string" do
    q1 = ListsOfCities::Query.new('Location/CountryRegion')
    xpath_string = q1.to_query
    expect(xpath_string).to eq("Location/CountryRegion")
  end

  it "should return a xpath string only contains @Code" do
    q1 = ListsOfCities::Query.new('Location/CountryRegion', code: ['1', 'USA'])
    xpath_string = q1.to_query
    expect(xpath_string).to eq("Location/CountryRegion[@Code='1' or @Code='USA']")
  end

  it "should return a xpath string only contains @Name" do
    q1 = ListsOfCities::Query.new('Location/CountryRegion', name: ['中国', '美国'])
    xpath_string = q1.to_query
    expect(xpath_string).to eq("Location/CountryRegion[@Name='中国' or @Name='美国']")
  end

  it "should return a xpath string that contains @Code and @Name" do
    q1 = ListsOfCities::Query.new('Location/CountryRegion', code: ['1', 'USA'], name: ['中国', '美国'])
    xpath_string = q1.to_query
    expect(xpath_string).to eq("Location/CountryRegion[@Code='1' or @Code='USA'][@Name='中国' or @Name='美国']")
  end

  context "ListsOfCities::Query.full_path_query_all" do
    it 'should return xpath for all countries' do
      expect(ListsOfCities::Query.full_path_query_all).to eq("Location/CountryRegion")
    end

    it 'should return xpath for all provinces under country("1")' do
      expect(ListsOfCities::Query.full_path_query_all("1")).to eq("Location/CountryRegion[@Code='1']/State")
    end

    it 'should return xpath for all cities under province("23") in country("1")' do
      expect(ListsOfCities::Query.full_path_query_all('1', '23')).to eq("Location/CountryRegion[@Code='1']/State[@Code='23']/City")
    end
    it 'should return xpath for all regions under country("1").province("23").city("1")' do
      expect(ListsOfCities::Query.full_path_query_all('1', '23', '1')).to eq("Location/CountryRegion[@Code='1']/State[@Code='23']/City[@Code='1']/Region")
    end
  end

  context 'ListsOfCities::Query.full_path_query' do
    it 'should return xpath for country("1")' do
      expect(ListsOfCities::Query.full_path_query('1')).to eq("Location/CountryRegion[@Code='1']")
    end

    it 'should return xpath for province("23") under country("1")' do
      expect(ListsOfCities::Query.full_path_query('1', '23')).to eq("Location/CountryRegion[@Code='1']/State[@Code='23']")
    end

    it 'should return xpath for city("1") under country("1").province("23")' do
      expect(ListsOfCities::Query.full_path_query('1', '23', '1')).to eq("Location/CountryRegion[@Code='1']/State[@Code='23']/City[@Code='1']")
    end

    it 'should return xpath for region("1") under country("1").province("23").city("1")' do
      expect(ListsOfCities::Query.full_path_query('1', '23', '1', '2')).to eq("Location/CountryRegion[@Code='1']/State[@Code='23']/City[@Code='1']/Region[@Code='2']")
    end

    let(:spiting){ ->{ListsOfCities::Query.full_path_query(nil)} }
    it 'shoud raise a NotFound error' do
      expect(spiting).to raise_exception(ListsOfCities::ActiveRecord::NotFound)
    end
  end

end
