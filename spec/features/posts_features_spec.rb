require 'rails_helper'

describe 'adding a post' do
	context 'when a user is not logged in' do
		before(:each) do
			post = create(:post)
			post.create_tags
		end

		it 'can view doppelgrammers but cannot add a post without signing in' do
			visit '/posts'
			expect(page).to have_content 'test'
			click_link 'Add a Doppelgrammer'
			expect(current_path).to eq new_user_session_path
		end 
	end

	context 'when a user is logged in' do
		let(:fake_class) { Class.new }
		before(:each) do
			dave = create(:user)
			login_as dave
			stub_const("NewPostNotifier", fake_class)
			dummy_class = NewPostNotifier
			dummy_class.stub_chain(:notify_new)
		end

		it 'prompts user to add a post' do
			visit '/posts'
			expect(page).to have_content "No doppelgrammers yet..."
			click_link 'Add a Doppelgrammer'
			expect(current_path).to eq new_post_path
			expect(page).to have_content 'First doppelgrammer'
		end

		it 'can add a post' do
			visit new_post_path
			fill_in 'post_caption1', with: "Jack Dee"
			fill_in 'post_caption2', with: "Detective Debug Dave"
			attach_file 'First doppelgrammer', Rails.root.join('spec/images/dave.png')
			attach_file 'Second doppelgrammer', Rails.root.join('spec/images/jack.png')
			click_button 'Submit'
			expect(page).to have_css 'img.first_upload'
			expect(page).to have_css 'img.second_upload'
			expect(page).to have_content 'Jack Dee'
			expect(page).to have_content "Detective Debug Dave"
		end

	end

end