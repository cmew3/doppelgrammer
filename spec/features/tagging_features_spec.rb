require 'rails_helper'

describe 'tagging' do
	let(:fake_class) { Class.new }
	before(:each) do
		dave = create(:user)
		login_as dave	
		stub_const("NewPostNotifier", fake_class)
		dummy_class = NewPostNotifier
		dummy_class.stub_chain(:notify_new)
	end

	it 'displays tags as links on posts' do
		visit new_post_path
		fill_in 'post_caption1', with: "Jack Dee"
		fill_in 'post_caption2', with: "Detective Debug Dave"
		attach_file 'First doppelgrammer', Rails.root.join('spec/images/dave.png')
		attach_file 'Second doppelgrammer', Rails.root.join('spec/images/jack.png')
		click_button 'Submit'
		expect(page).to have_link '#detectivedebugdave'
		expect(page).to have_link '#jackdee'
	end
end

describe 'filtering by tags' do
	before(:each) do
		dave = create(:user)
		login_as dave
		create(:post, caption1: 'jack', caption2: 'dave').create_tags
		create(:post, caption1: 'tom', caption2: 'dave').create_tags
	
	end

	it 'filters to show posts with selected tag' do
		visit '/posts'
		click_link '#jack'
		expect(page).to have_content 'Doppelgrammers of #jack'
		expect(page).to have_content 'dave'
		expect(page).not_to have_content 'tom'
	end


	it 'filtered tags have pretty URLs' do
		visit '/tags/jack'
		expect(page).to have_content 'Doppelgrammers of #jack'
		expect(page).to have_content 'dave'
		expect(page).not_to have_content 'tom'
	end
end	