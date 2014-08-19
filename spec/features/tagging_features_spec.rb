require 'rails_helper'

describe 'tagging' do
	before(:each) do
		dave = User.create(email: 'dave@dave.com', password: '12345678', password_confirmation: '12345678')
		login_as dave
	end

	it 'displays tags as links on posts' do
		visit new_post_path
		fill_in 'Caption1', with: "Jack Dee"
		fill_in 'Caption2', with: "Detective Debug Dave"
		attach_file 'First doppelgrammer', Rails.root.join('spec/images/dave.png')
		attach_file 'Second doppelgrammer', Rails.root.join('spec/images/jack.png')
		fill_in 'Tags', with: '#yolo, #swag'
		click_button 'Create Post'
		expect(page).to have_link '#yolo'
		expect(page).to have_link '#swag'
	end
end