class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.integer :user_id
      t.string :image
      t.string :name
      t.integer :width
      t.integer :height
      t.string :size
      t.string :category, default: "General"
      t.integer :views, default: 0
      t.integer :favourites, default: 0
      t.string :source, default: "Unknown"

      t.timestamps null: false
    end
  end
end
