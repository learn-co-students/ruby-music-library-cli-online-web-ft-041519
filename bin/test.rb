require 'pry'
require_relative '../config/environment.rb'

class Test
  extend Concerns::TestModule

  attr_accessor :name
  def initialize(name)
    @name = name
  end
end


#test = Test.new("new test")
#Test.test_method

artist = Artist.create("new artist")
puts Artist.find_by_name("new artist")
#binding.pry
