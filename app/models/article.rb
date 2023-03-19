class Article < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
  has_many :tag

  def self.search(search)
    return Article.all unless search
    Article.where(['title LIKE ?', "%#{search}%"])
  end

end
