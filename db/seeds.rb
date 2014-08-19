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
									picture2: File.new(Rails.root.join('spec/images/jack.png')),
									tags: [Tag.create(text: "classic_dave")])

Post.create(caption1: 'Tom Hanks', caption2: 'Thomas Beeley',
									picture1: File.new(Rails.root.join('spec/images/thomas.png')),
									picture2: File.new(Rails.root.join('spec/images/tom-hanks.png')))

Post.create(caption1: 'Matt LeBlanc', caption2: 'Marco',
									picture1: File.new(Rails.root.join('spec/images/marco.png')),
									picture2: File.new(Rails.root.join('spec/images/matt-leblanc.png')))

Post.create(caption1: 'Khal Drogo', caption2: 'Talal',
									picture1: File.new(Rails.root.join('spec/images/talal.png')),
									picture2: File.new(Rails.root.join('spec/images/drogo.png')))