require "spec_helper"

describe ListsOfCities::AdministrativeDivision do
  context "AdministrativeDivision.xml_node_path_for_all should get xml node name by default" do
    it "should be Location" do
      expect(ListsOfCities::Root.xml_node_path_for_all).to eq('Location')
    end

    it "should be CountryRegion" do
      expect(ListsOfCities::Country.xml_node_path_for_all).to eq('CountryRegion')
    end

    it "should be City" do
      expect(ListsOfCities::City.xml_node_path_for_all).to eq('City')
    end
    
    it "should be State" do
      expect(ListsOfCities::Province.xml_node_path_for_all).to eq('State')
    end
    
    it "should be Region" do
      expect(ListsOfCities::Region.xml_node_path_for_all).to eq('Region')
    end
    
  end
end
