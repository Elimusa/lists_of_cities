require "spec_helper"

describe ListsOfCities::Province do
  it "should get the xml node name State" do
    expect(ListsOfCities::Province.xml_node_name).to eq("State")
  end
end
