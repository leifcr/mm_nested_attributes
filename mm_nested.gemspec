# encoding: UTF-8
#require File.expand_path('../lib/mongo_mapper/plugins/version.rb', __FILE__)

Gem::Specification.new do |s|
  s.name               = 'mm_nested'
  s.homepage           = 'http://github.com/luuf/mm_nested'
  
  s.summary            = 'nested plugin for Mongo Mapper'
  s.authors            = ['Leif Ringstad']
  s.email              = ['leifcr@gmail.com']
	s.version            = '0.1.0'
	#s.version            = MongoMapper::Plugins::nested::VERSION
  s.platform           = Gem::Platform::RUBY
  # s.files              = Dir.glob("{lib,test}/**/*") + %w[LICENSE README.markdown]
  s.files = [ "Gemfile", 
              "History.txt",   
  					 	"LICENSE", 
  					 	"mm_nested.gemspec", 
  					 	"Rakefile", 
  					 	"README.markdown", 
  					 	"lib/mm_nested.rb", 
  					 	"lib/mongo_mapper/plugins/nested.rb", 
  					 	"mm_nested.gemspec"]

  s.require_paths 		 = ["lib"]
end