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
			fill_in 'Caption1', with: "Jack Dee"
			fill_in 'Caption2', with: "Detective Debug Dave"
			attach_file 'Picture1', Rails.root.join('spec/images/dave.png')
			attach_file 'Picture2', Rails.root.join('spec/images/jack.png')
			click_button 'Create Post'
			expect(page).to have_content 'First doppelgrammer'
			expect(page).to have_css 'img.first_upload'
			expect(page).to have_css 'img.second_upload'
			expect(page).to have_content 'Jack Dee'
			expect(page).to have_content "Detective Debug Dave"
		end


	end	
end