require 'rails_helper'

describe 'votes' do
	context 'when not logged in' do
		it 'user cannot cast votes' do

		end
	end

	context 'when logged in' do
		before(:each) do
			dave = User.create(email: 'dave@dave.com', password: '12345678', password_confirmation: '12345678')
			login_as dave

			Post.create(caption1: 'test', caption2: 'test',
									picture1: File.new(Rails.root.join('spec/images/dave.png')),
									picture2: File.new(Rails.root.join('spec/images/jack.png'))).create_tags
		end

		it 'user can vote up a post' do
			visit '/posts'
			expect(page).to have_css('.doppelyes-count', text: '0')
			click_link 'doppelYES!'
			expect(page).to have_css('.doppelyes-count', text: '1')
		end
	end
end