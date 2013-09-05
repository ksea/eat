class Menu < ActiveRecord::Base
	# attr_accessible :is_box,:name, :desc, :sort, :rest_id
	# type => 1
	def self.all_lunchboxs
		Menu.where(:is_box => 1)
	end

	# type => 2
	def self.all_foods
		# rests = Restaurant.all
		menus = Menu.where(:is_box => 0)

		menus.map do |m|
			m[:mfoods] = Food.where(:menu_id => m.id, :sort => 1)
			m[:vfoods] = Food.where(:menu_id => m.id, :sort => 2)
		end

		menus
	end
end
