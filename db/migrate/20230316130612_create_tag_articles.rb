class CreateTagArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_articles do |t|

      t.timestamps
    end
  end
end
