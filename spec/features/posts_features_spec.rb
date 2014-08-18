require 'rails_helper'

describe 'adding a post' do
	context 'when there are no posts' do
		it 'prompts user to add a post' do
			visit '/posts'
			expect(page).to have_content "No doppelgrammers yet..."
			click_link 'Add a post'
			expect(current_path).to eq new_post_path
			expect(page).to have_content 'Upload your doppelgrammers'
		end

		it 'can add a post' do
			visit new_post_path
			fill_in 'Title', with: "First doppelgrammer"
			attach_file 'Picture1', Rails.root.join('spec/images/dave.png')
			click_button 'Create Post'
			expect(page).to have_content 'First doppelgrammer'
			expect(page).to have_css 'img.first_upload'
		end


	end	
end