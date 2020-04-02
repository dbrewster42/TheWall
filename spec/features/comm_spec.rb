require 'rails_helper'
feature "post message" do
	before(:each) do 
		visit new_user_path
		fill_in "user[name]", with: "John"
		click_button "Sign In"
    	visit messages_path
	end
	before(:each) do
		fill_in "message[content]", with: "This is the content of my message."
		click_button "Post a Message"
	end

	scenario "successfully post a comment" do
		fill_in "comment[content]", with: "This is the content of my messacommentge."
		click_button "Post a Comment"
		expect(page).to have_content "This is the content of my message"
		expect(current_path).to eq(messages_path)
	end
	scenario "unsuccessfully post a message" do
		fill_in "comment[content]", with: ""
		click_button "Post a Comment"
		expect(page).to have_content "Content is too short"
		expect(current_path).to eq(messages_path)
	end
end