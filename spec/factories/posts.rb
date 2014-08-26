FactoryGirl.define do
  factory :post do
    caption1 'test'
    caption2 'test2'
	picture1 File.new(Rails.root.join('spec/images/dave.png'))
	picture2 File.new(Rails.root.join('spec/images/jack.png'))
	hire_charge 50
  end
end

