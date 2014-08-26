require 'rails_helper'

describe 'hiring doppelgrammers'

	context 'setting a price as part of a post' do

		before(:each) do
			dave = create(:user)
			login_as dave
		end

		it 'has a default price of £50' do
			visit new_post_path
			fill_in 'post_caption1', with: "Jack Dee"
			fill_in 'post_caption2', with: "Detective Debug Dave"
			attach_file 'First doppelgrammer', Rails.root.join('spec/images/dave.png')
			attach_file 'Second doppelgrammer', Rails.root.join('spec/images/jack.png')
			click_button 'Submit'
			expect(page).to have_content 'Price: £50'
		end


		it 'user can set a hire price for a post' do
			visit new_post_path
			fill_in 'post_caption1', with: "Jack Dee"
			fill_in 'post_caption2', with: "Detective Debug Dave"
			attach_file 'First doppelgrammer', Rails.root.join('spec/images/dave.png')
			attach_file 'Second doppelgrammer', Rails.root.join('spec/images/jack.png')
			fill_in 'post_hire_charge', with: '80'
			click_button 'Submit'
			expect(page).to have_content 'Price: £80'

		end

	end