class AddCoordinatesToPaparazzis < ActiveRecord::Migration[7.0]
  def change
    add_column :paparazzis, :latitude, :float
    add_column :paparazzis, :longitude, :float
  end
end
