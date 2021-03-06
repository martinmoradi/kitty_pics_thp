# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'activerecord-reset-pk-sequence'

ActiveRecord::Base.connection.disable_referential_integrity do
  User.delete_all
  User.reset_pk_sequence
  AssigmentProductCategory.delete_all
  AssigmentProductCategory.reset_pk_sequence
  Category.delete_all
  Category.reset_pk_sequence
  Product.delete_all
  Product.reset_pk_sequence
end

5.times do
  User.create!(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.unique.free_email,
    password: Faker::Internet.password(min_length: 8),
    encrypted_password: Faker::Internet.password(min_length: 8),
    is_admin: false
  )
end

puts '5 users seeded'

12.times do
  Product.create!(
    title: Faker::Creature::Cat.name,
    description: Faker::Lorem.paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 6),
    price: Faker::Number.within(range: 25..200),
    img_url: Faker::LoremPixel.image(size: '640x640', is_gray: false, category: 'cats')
  )
end

puts '16 products seeded'

10.times do
  Category.create!(
    name: Faker::Creature::Cat.breed
  )
end

puts '6 categories seeded'

Product.ids.each do |id|
  AssigmentProductCategory.create!(
    product_id: id,
    category_id: Category.ids.sample
  )
end

puts 'Categories applied to products'
