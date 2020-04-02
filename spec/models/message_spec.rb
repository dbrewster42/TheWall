require 'rails_helper'

RSpec.describe Message, type: :model do
	it "should save" do      
      expect(build(:message, user: build(:user))).to be_valid
  	end
	it "should not save if no user" do 
      message = Message.new(
        content: 'This is a message'               
      )
      expect(message).to be_invalid
  	end  	
	it "should not save content is too short" do 
      message = Message.new(
        content: 'This',
        user_id: '1'       
      )
      expect(message).to be_invalid
  	end  	  	
end