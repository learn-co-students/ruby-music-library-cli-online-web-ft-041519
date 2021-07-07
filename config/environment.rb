require 'bundler'
Bundler.require

module Concerns
  module Findable
     def self.find_by_name(name)
    self.all.find {|song| song.name == name} 
  end
  
   def self.find_or_create_by_name(name)
     if !self.find_by_name(name)
        Song.create(name)
      else 
        self.find_by_name(name)
    end 
  end 
  end 
end

require_all 'lib' 
