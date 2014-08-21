require 'rails_helper'

describe 'votes' do
	context 'when not logged in' do
		it 'user cannot cast votes' do

		end
	end

	context 'when logged in' do
		before(:each) do
			dave = create(:user)
			login_as dave

			create(:post).create_tags
		end

		it 'user can vote up a post', js: true do
			visit '/posts'
			expect(page).to have_css('.yes-count', text: '0')
			find(".doppelYES-link").click
			expect(page).to have_css('.yes-count', text: '1')
		end

		it 'user can vote down a post', js: true do
			visit '/posts'
			expect(page).to have_css('.no-count', text: '0')
			find(".doppelNO-link").click
			expect(page).to have_css('.no-count', text: '1')
		end
	end
end