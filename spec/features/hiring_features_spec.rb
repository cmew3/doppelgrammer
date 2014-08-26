require 'rails_helper'

describe 'hiring doppelgrammers' do

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

		it 'does not allow invalid hire charges' do
			visit new_post_path
			fill_in 'post_caption1', with: "Jack Dee"
			fill_in 'post_caption2', with: "Detective Debug Dave"
			attach_file 'First doppelgrammer', Rails.root.join('spec/images/dave.png')
			attach_file 'Second doppelgrammer', Rails.root.join('spec/images/jack.png')
			fill_in 'post_hire_charge', with: '-80'
			click_button 'Submit'
			expect(page).to have_content 'must be greater than'
		end

	end

	context 'hiring a doppelgrammer' do

		before(:each) do
			dave = create(:user)
			login_as dave
			create(:post, caption1: 'Jack', caption2: 'Dave', hire_charge: 80).create_tags
		end

		it 'can follow a link to hire a doppelgrammer', js: true do
			visit posts_path
			click_link 'Hire Doppelgrammer'
			expect(page).to have_content 'Hire Dave to come to your event dressed as Jack'
			expect(page).to have_content 'Amount: £80'
			click_button 'Pay with Card'    
			# expect(page).to have_content 'Doppelgrammer hire charge'
			# expect(page).to have_button 'Pay £80.00'
		end

	end

end