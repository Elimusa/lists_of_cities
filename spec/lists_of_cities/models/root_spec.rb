require "spec_helper"

describe ListsOfCities::Root do
  it "should get the xml node name Location" do
    expect(ListsOfCities::Root.xml_node_name).to eq("Location")
  end
end
