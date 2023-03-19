class AddReferencesToTagArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :tag_articles, :article, null: false, foreign_key: true
    add_reference :tag_articles, :tag, null: false, foreign_key: true
  end
end
