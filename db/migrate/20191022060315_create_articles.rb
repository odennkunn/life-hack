class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer     :user_id, null: false, foreign_key: true
      t.string      :title, null: false
      t.text        :text, null: false
      t.string      :image, null: false
      t.string      :category, null: false
      t.timestamps  null: true
    end
  end
end
