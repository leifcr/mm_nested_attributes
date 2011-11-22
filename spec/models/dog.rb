require "mongo_mapper"
require "mm_nested"
class Dog
  include MongoMapper::Document
  plugin MongoMapper::Plugins::AcceptsNestedAttributes
  key :name, String
  one :monkey
  many :apes
end
