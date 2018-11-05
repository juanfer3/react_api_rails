class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.references :post, foreign_key: true
      t.string :information

      t.timestamps
    end
  end
end
