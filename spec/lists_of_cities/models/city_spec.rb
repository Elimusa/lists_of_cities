require "spec_helper"

describe ListsOfCities::City do
  it "should get the xml node name City" do
    expect(ListsOfCities::City.xml_node_name).to eq("City")
  end
end
