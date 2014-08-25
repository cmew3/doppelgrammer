# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.destroy_all
Post.create(caption1: 'Jack Dee', caption2: 'Detective Debug Dave',
									picture1: File.new(Rails.root.join('spec/images/dave.png')),
									picture2: File.new(Rails.root.join('spec/images/jack.png'))).create_tags

Post.create(caption1: 'Tom Hanks', caption2: 'Thomas Beeley',
									picture1: File.new(Rails.root.join('spec/images/thomas.png')),
									picture2: File.new(Rails.root.join('spec/images/tom-hanks.png'))).create_tags

Post.create(caption1: 'Matt LeBlanc', caption2: 'Marco',
									picture1: File.new(Rails.root.join('spec/images/marco.png')),
									picture2: File.new(Rails.root.join('spec/images/matt-leblanc.png'))).create_tags

Post.create(caption1: 'Khal Drogo', caption2: 'Talal',
									picture1: File.new(Rails.root.join('spec/images/talal.png')),
									picture2: File.new(Rails.root.join('spec/images/drogo.png'))).create_tags

Post.create!(caption1: 'Gary Barlow', caption2: 'Method Man Charlie',
									picture1: File.new(Rails.root.join('spec/images/Charlie.jpg')),
									picture2: File.new(Rails.root.join('spec/images/gary_barlow.png'))).create_tags

Post.create!(caption1: 'King George V', caption2: 'Eddie',
									picture1: File.new(Rails.root.join('spec/images/eddie.png')),
									picture2: File.new(Rails.root.join('spec/images/king_george_v.jpg'))).create_tags