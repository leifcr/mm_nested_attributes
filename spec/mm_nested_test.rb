require 'test_helper'
require 'set'

class MmDraftTest < Test::Unit::TestCase
  context "record" do
    def setup
	    Dog.accepts_nested_attributes_for(:monkey, :apes, :allow_destroy => true)
	    Dog.collection.remove
  	end

	context "A Document" do
		setup do
		  @dog = Dog.create(:name => 'Rufus',
		                    :monkey_attributes => [{:name => 'Boink'}],
		                    :apes_attributes => [{:name => 'Pess'}]
		                    )
		end

		should "accept nested attributes for embedded documents" do
		  @dog.monkey.size.should == 1
		end
		should "accept nested attributes for associated documents" do
		  @dog.apes.size.should == 1
		end

		context "which already exists" do
			setup do
		    	monkey       = @dog.monkey.first.attributes.merge({:_destroy => true})
			    ape          = @dog.apes.first.attributes.merge({:_destroy => true})
			    
			    # @dog.update_attributes(:monkey_attributes => [monkey], :apes_attributes => [ape])
			    @dog.attributes = {:monkey_attributes => [monkey], :apes_attributes => [ape]}
		  	end

		  	should "not destroy associated documents until the document is saved" do
		    	@dog.apes.size.should == 1
		  	end
		  
		  	should "destroy embedded documents when saved" do
			    @dog.save
		    	@dog.reload
		    	@dog.monkey.size.should == 0
		  	end

		  	should "destroy associated documents when saved" do
			    @dog.save
		    	@dog.reload
		    	@dog.apes.size.should == 0
		  	end      
		end

	end

	should "raise an ArgumentError for non existing associations" do
		lambda {
		  Dog.accepts_nested_attributes_for :blah
		}.should raise_error(ArgumentError)
	end
  end
end
