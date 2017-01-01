require "spec_helper"

describe ListsOfCities::Region do
  it "should get the xml node name Region" do
    expect(ListsOfCities::Region.xml_node_name).to eq("Region")
  end
end
