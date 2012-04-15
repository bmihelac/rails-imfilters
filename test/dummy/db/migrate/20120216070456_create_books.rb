class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.integer :author_id
      t.date :published_on
      t.boolean :active
      t.text :content
      t.integer :year_published

      t.timestamps
    end
  end
end
