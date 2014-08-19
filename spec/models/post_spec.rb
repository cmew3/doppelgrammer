require 'rails_helper'

RSpec.describe Post, :type => :model do

	context 'validations' do
	    it 'is invalid with no caption' do
			post = Post.new(caption1: 'test',
									picture1: File.new(Rails.root.join('spec/images/marco.png')),
									picture2: File.new(Rails.root.join('spec/images/matt-leblanc.png')))
			expect(post).to have(1).error_on(:caption2)
		end

		it 'is invalid if caption is longer than 30 chars' do
			post = Post.new(caption1: 'test',
							caption2: 'a' * 31,
							picture1: File.new(Rails.root.join('spec/images/marco.png')),
							picture2: File.new(Rails.root.join('spec/images/matt-leblanc.png')))
			expect(post).to have(1).error_on(:caption2)
		end

		it 'in invalid without pictures' do
			post = Post.new(caption1: 'test',
							caption2: 'test2')
			expect(post).to have(1).error_on(:picture2)
			post.save
			expect(Post.count).to eq 0
		end

	end


	context 'tags' do
		
		let(:post) do
			Post.new(caption1: 'test', caption2: 'test',
							picture1: File.new(Rails.root.join('spec/images/marco.png')),
							picture2: File.new(Rails.root.join('spec/images/matt-leblanc.png')))
		end

		it 'can have no tags' do
			post.tag_list = ""
			expect(post.tags).to be_empty
		end

		it 'can have a single tag' do
			post.tag_list = "#mega"
			expect(post.tags.first.text).to eq '#mega'
		end

		it 'can have multiple tags' do
			post.tag_list = "#mega #ace"
			expect(post.tags.length).to eq 2
		end

		it 'does not add repeat tags' do
			post.tag_list = "#mega #ace #mega"
			expect(post.tags.length).to eq 2
		end

		it 'does not recreate existing tags but does assign tag to post' do
			Tag.create(text: "#ace")
			post.tag_list = "#mega #ace"
			expect(Tag.count).to eq 2
			expect(post.tags.length).to eq 2
		end
	end

end
