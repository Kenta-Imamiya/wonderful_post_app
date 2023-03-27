# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |n|
  User.create(
    email: "user00#{n + 1}@test.com",
    password: "test1234"
  )
end

50.times do |n|
  Article.find_or_create_by(
    title: "No.#{n + 1}:user001の記事",
    content: "No.#{n + 1}:user001の記事の本文",
    user_id: 1
  )
end

50.times do |n|
  Article.find_or_create_by(
    title: "No.#{n + 1}:user002の記事",
    content: "No.#{n + 1}:user002の記事の本文",
    user_id: 2
  )
end

50.times do |n|
  Article.find_or_create_by(
    title: "No.#{n + 1}:user003の記事",
    content: "No.#{n + 1}:user003の記事の本文",
    user_id: 3
  )
end

3.times do |n|
  Tag.find_or_create_by(
    name: "テストタグ#{n + 1}"
  )
end


article1 = Article.where(id: 1..50)
article1.ids.sort.each do |article_id|
  TagArticle.find_or_create_by(tag_id: 1, article_id: article_id)
end

article2 = Article.where(id: 51..100)
article2.ids.sort.each do |article_id|
  TagArticle.find_or_create_by(tag_id: 2, article_id: article_id)
end

article3 = Article.where(id: 101..150)
article3.ids.sort.each do |article_id|
  TagArticle.find_or_create_by(tag_id: 3, article_id: article_id)
end
