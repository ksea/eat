class Order < ActiveRecord::Base
	before_save :before_save

	def self.chose(tip,tid,mfood=nil,vfood=nil)
		# day_str = Time.now.strftime('%Y%m%d')
		order = Order.where(:ip => tip).first
		if order.nil?
			order = Order.create :ip => tip
		end

		return if 0 == tid && 0 == mfood && 0 == vfood

		menu = Menu.where(:id => tid).first
		if menu.present?
			order.mfood = 0
			order.vfood = 0
			order.menu_id = menu.id
			order.is_box = menu.is_box
			order.updated_at = Time.now
			order.save
			return
		end

		if mfood > 0
			f = Food.where(:id => mfood).first
			if f.present?
				if order.menu_id != f.menu_id
					order.vfood = 0
					order.is_box = 0
					order.menu_id = f.menu_id
				end
				order.mfood = mfood
			end
		end
		if vfood > 0
			f = Food.where(:id => vfood).first
			if f.present?
				if order.menu_id != f.menu_id
					order.mfood = 0
					order.is_box = 0
					order.menu_id = f.menu_id
				end
				order.vfood = vfood
			end
		end
		order.save
	end


	def self.get_today(tip)
		day_str = Time.now.strftime('%Y%m%d')
		order = Order.where(:ip => tip).first
		return Order.new if order.nil?
		order
	end

	# def self.all_today
		# day_str = Time.now.strftime('%Y%m%d')
		# Order.where(:date => day_str)
	# end

	def self.say(tip,tdesc)
		order = Order.where(:ip => tip).first
		if order.nil?
			Order.create :ip => tip
		end

		order.desc = tdesc
		order.save
	end

	private

	def before_save
		self.updated_at = Time.now
	end
end
