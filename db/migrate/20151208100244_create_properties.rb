class CreateProperties < ActiveRecord::Migration
	def change
		create_table :properties do |t|

			t.text		:description
			t.string	:location
			t.string	:availability
			t.decimal	:price, precision: 5, scale: 2
			t.integer	:user_id
			
			t.timestamps null:false
			end


	end
end
