module Findable 
  
    def find_by_name 
    self.all.detect {|song| song.name == name}   
  end 
  
  def find_or_create_by_name 
    self.all.find {|song| song.name == name} || self.new(name).save  
  end 
  
end 