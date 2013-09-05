class MenuController < ApplicationController
  before_filter :check_admin,:only=>[:add,:edit,:delete,:update]

  def index
    @lunchboxs = Menu.all_lunchboxs
  	@foods = Menu.all_foods
  	@today = Order.get_today(@remote_ip)
  end

  def edit
    @lunchboxs = Menu.all_lunchboxs
    @foods = Menu.all_foods
    @today = Order.get_today(@remote_ip)
  end

  def add
    is_box = params[:is_box].to_i
    menu = Menu.create :name => params[:name],:desc => params[:desc], :is_box => is_box
    if is_box.zero?
      params[:mfood].map do |m|
        next if m.blank?
        Food.create :name => m, :menu_id => menu.id, :sort => 1
      end

      params[:vfood].map do |v|
        next if v.blank?
        Food.create :name => v, :menu_id => menu.id, :sort => 2
      end
    end

  	redirect_to :edit
  end


	def select
		Order.chose(@remote_ip,params[:id].to_i,params[:mfood].to_i,params[:vfood].to_i)

  	redirect_to :root
	end


  def delete
  	Menu.where(:id => params[:id].to_i).first.delete

    Order.where(:menu_id => params[:id].to_i).map(&:delete)

  	redirect_to :edit
  end

  def food_delete
    id = params[:id].to_i
    Food.where(:id => id ).first.delete
    Order.where("mfood = #{id} or vfood=#{id}").map(&:delete)
    redirect_to :edit
  end

  def food_add
    menu = Menu.where(:id => params[:menu_id].to_i).first
    if menu.present? && !params[:name].blank? && params[:sort].to_i > 0
      Food.create :name => params[:name], :menu_id => menu.id, :sort => params[:sort].to_i
    end
    redirect_to :edit
  end

  def update
    lunchbox = Lunchbox.where(:id => params[:id].to_i).first
    render :json => 0 and return if lunchbox.blank?
    
    lunchbox.update_attributes(:name => params[:name],:desc => params[:desc])
    render :json => 1
  end

  def say
    Order.say(@remote_ip,params[:desc])
    redirect_to :root
  end

  def look
    @menus = Menu.order("is_box desc")
  	orders = Order.where("menu_id > 0").order("mfood")
  	@order_arr = {}

    @menus.map do |m|
      @order_arr[m.id] = [] 
    end

  	orders.map do |o|
  		@order_arr[o.menu_id] << o
  	end
    
    foods = Food.all
    @food_names = {}
    foods.map do |f|
      @food_names[f.id] = f.name
    end
  end

end
