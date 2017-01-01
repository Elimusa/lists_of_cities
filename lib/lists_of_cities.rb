require "lists_of_cities/version"
require 'nokogiri'
require 'active_support/core_ext/object'
require 'active_support/concern'

class Nokogiri::XML::Element
  def to_division(parent_division=nil)
    @parent_division = parent_division
    case self.name
    when 'Location'
      ListsOfCities::Root.new(name: '', code: '')
    when 'CountryRegion'
      ListsOfCities::Country.new(self.to_division_hash)
    when 'State'
      ListsOfCities::Province.new(self.to_division_hash)
    when 'City'
      ListsOfCities::City.new(self.to_division_hash)
    when 'Region'
      ListsOfCities::Region.new(self.to_division_hash)
    else
      nil
    end
  end

  def to_division_hash
    {name: self["Name"], code: self["Code"], parent: @parent_division, xpath: self.path, parent_xpath: self.parent.path}
  end
end

module ListsOfCities
  class << self
    extend Forwardable

    def_delegators :global, :countries, :provinces, :cities, :regions, :country, :province, :city, :region

    alias :states :provinces
    alias :state :province

    def global
      ListsOfCities::GlobalClassMethods
    end
  end
end

require 'lists_of_cities/data_source'
require 'lists_of_cities/active_record'
require 'lists_of_cities/administrative_division'
require 'lists_of_cities/division_list'
require 'lists_of_cities/query'
require 'lists_of_cities/association'
require 'lists_of_cities/models/root'
require 'lists_of_cities/models/country'
require 'lists_of_cities/models/province'
require 'lists_of_cities/models/city'
require 'lists_of_cities/models/region'
require 'lists_of_cities/global_class_methods'
