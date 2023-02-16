class AddColumnsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :booking_location, :string
    add_column :bookings, :meeting_date, :datetime
    add_column :bookings, :special_request, :text
  end
end
