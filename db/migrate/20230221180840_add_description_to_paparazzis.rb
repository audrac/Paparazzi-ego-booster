class AddDescriptionToPaparazzis < ActiveRecord::Migration[7.0]
  def change
    add_column :paparazzis, :description, :text
  end
end
