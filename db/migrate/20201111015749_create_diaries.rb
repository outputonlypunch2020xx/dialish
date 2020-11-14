class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.text :diary_text
      t.string :titel, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
