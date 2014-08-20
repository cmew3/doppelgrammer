require 'rails_helper'

RSpec.describe Post, :type => :model do

	context 'validations' do
	    it 'is invalid with no caption' do
			post = Post.new(caption1: 'test',
									picture1: File.new(Rails.root.join('spec/images/marco.png')),
									picture2: File.new(Rails.root.join('spec/images/matt-leblanc.png')))
			expect(post).to have(2).errors_on(:caption2)
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

		it 'cannot have punctuation in a caption' do
			post = Post.new(caption1: 'test, test', caption2: 'test',
											picture1: File.new(Rails.root.join('spec/images/marco.png')),
											picture2: File.new(Rails.root.join('spec/images/matt-leblanc.png')))
			expect(post).to have(1).error_on(:caption1)
		end

		it 'cannot have special chars in a caption' do
			post = Post.new(caption1: 'test', caption2: '#test',
											picture1: File.new(Rails.root.join('spec/images/marco.png')),
											picture2: File.new(Rails.root.join('spec/images/matt-leblanc.png')))
			expect(post).to have(1).error_on(:caption2)
		end
	end

	context 'generating tags' do
		
		let(:post) { create(:post, caption1: 'John Doe', caption2: 'Sarah Bloggs')}

		it 'creates a tag based on the caption text' do
			post.create_tags
			expect(Tag.first.text).to eq '#sarahbloggs'
			expect(Tag.last.text).to eq '#johndoe'
		end

		it 'does not recreate existing tags but does assign tag to post' do
			Tag.create(text: "#johndoe")
			post.create_tags
			expect(Tag.count).to eq 2
			expect(post.tags.length).to eq 2
		end


	end

	context 'counting votes' do

		let(:post) 		{ create(:post) }
		before(:each) do
			2.times {post.votes << Vote.create(direction: 'up')}
			post.votes << Vote.create(direction: 'down')
		end

		it 'can count the upvotes' do
			expect(post.count_upvotes).to eq 2
		end

		it 'can count the downvotes' do
			expect(post.count_downvotes).to eq 1
		end

	end

end
