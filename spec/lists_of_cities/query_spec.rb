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

end
