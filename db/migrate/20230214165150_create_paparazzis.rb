class CreatePaparazzis < ActiveRecord::Migration[7.0]
  def change
    create_table :paparazzis do |t|
      t.string :style
      t.string :name
      t.integer :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
