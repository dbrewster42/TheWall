require 'rails_helper'
feature "User creates an account" do
	before(:each) do 
    	visit new_user_path
	end
	scenario "successfully creates a new user account" do
    	fill_in "user[name]", with: "shane"
    	click_button "Sign In"
    	expect(page).to have_content "Welcome shane"
	end
	scenario "unsuccessfully creates a new user account" do 
		click_button "Sign In"
		expect(current_path).to eq(new_user_path)
  	end
  
end