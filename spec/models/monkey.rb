require "mongo_mapper"
class Monkey
  include MongoMapper::EmbeddedDocument
  key :name, String
end
