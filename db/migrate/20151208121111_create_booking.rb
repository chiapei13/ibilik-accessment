class CreateBooking < ActiveRecord::Migration
	def change

		create_table :bookings do |t|

			t.string :status
			t.integer	:user_id
			t.integer	:property_id
			
			t.timestamps null: false
		end

	end
end


