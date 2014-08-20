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
		click_button 'Create Post'
		expect(page).to have_link '#detectivedebugdave'
		expect(page).to have_link '#jackdee'
	end
end

describe 'filtering by tags' do
	before(:each) do
		dave = User.create(email: 'dave@dave.com', password: '12345678', password_confirmation: '12345678')
		login_as dave

		Post.create(caption1: 'test', caption2: 'test',
									picture1: File.new(Rails.root.join('spec/images/dave.png')),
									picture2: File.new(Rails.root.join('spec/images/jack.png')),
									tag_list: '#jack #dave')
		Post.create(caption1: 'cheese', caption2: 'cheese',
									picture1: File.new(Rails.root.join('spec/images/dave.png')),
									picture2: File.new(Rails.root.join('spec/images/jack.png')),
									tag_list: '#mega #beans')
	end

	xit 'filters to show posts with selected tag' do
		visit '/posts'
		click_link '#ace'
		expect(page).to have_content 'Posts tagged with #ace'
		expect(page).to have_content 'test'
		expect(page).not_to have_content 'cheese'
	end


	xit 'filtered tags have pretty URLs' do
		visit '/tags/ace'
		expect(page).to have_content 'Posts tagged with #ace'
		expect(page).to have_content 'test'
		expect(page).not_to have_content 'cheese'
	end
end	