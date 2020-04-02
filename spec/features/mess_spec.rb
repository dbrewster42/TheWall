require 'rails_helper'
feature "post message" do
	context "with no login" do
		scenario "unsuccessfully post a message no user" do
			visit messages_path
			fill_in "message[content]", with: "This is the content of my message."
			click_button "Post a Message"
			expect(page).to have_content "User must exist"			
		end
	end
	context "with login" do
		before(:each) do 
			visit new_user_path
			fill_in "user[name]", with: "John"
			click_button "Sign In"
	    	visit messages_path
		end
		scenario "successfully post a message" do
			fill_in "message[content]", with: "This is the content of my message."
			click_button "Post a Message"
			expect(page).to have_content "This is the content of my message"
			expect(page).to have_current_path(messages_path)
		end
		scenario "unsuccessfully post a message no content" do
			fill_in "message[content]", with: ""
			click_button "Post a Message"
			expect(page).to have_content "Content is too short"
			expect(page).to have_current_path(messages_path)
		end
		scenario "messages page should have a log out button" do
			click_button "logout"
			expect(page).to have_current_path(new_user_path)
		end
	end
end