require 'rails_helper'

RSpec.describe User, type: :model do
	it "should save" do 
      user = User.new(
        name: 'shane'        
      )
      expect(user).to be_valid
  	end
	it "should not save" do 
      user = User.new(
        name: 'sha'        
      )
      expect(user).to be_invalid
  	end  	
end
