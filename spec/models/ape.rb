require "mongo_mapper"
class Ape
  include MongoMapper::EmbeddedDocument
  key :name, String
end
