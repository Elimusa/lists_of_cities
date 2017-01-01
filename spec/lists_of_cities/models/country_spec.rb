require "spec_helper"

describe ListsOfCities::Country do
  it "should get the xml node name CountryRegion" do
    expect(ListsOfCities::Country.xml_node_name).to eq("CountryRegion")
  end
end
