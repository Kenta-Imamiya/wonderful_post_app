class Tag < ApplicationRecord
  has_many :tag_articles
  has_many :articles, through: :tag_articles
end
