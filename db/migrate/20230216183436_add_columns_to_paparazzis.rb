class AddColumnsToPaparazzis < ActiveRecord::Migration[7.0]
  def change
    add_column :paparazzis, :location, :string
    add_column :paparazzis, :price, :decimal
  end
end
