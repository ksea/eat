# encoding: utf-8
class Setup < ActiveRecord::Migration
  
  def self.up
    create_table(:menus, :options => 'ENGINE=MyISAM DEFAULT CHARSET=utf8') do |t|
      t.column :name,       		:string, :limit => 20, :default => "", :null => false
      t.column :position,      	:integer, :null => false, :default => 0 
      t.column :show,     			:boolean, :default => true, :null => false
    end

    create_table(:orders, :options => 'ENGINE=MyISAM DEFAULT CHARSET=utf8') do |t|
      t.column :ip,       			:string, :limit => 20, :default => "", :null => false
      t.column :chose,      		:integer, :null => false, :default => 0 
      t.column :date,     			:string, :default => 20, :null => false
      t.column :updated_at,     :timestamp
    end

    Menu.create :name => '火爆肥肠',:position => 1
    Menu.create :name => '炝炒凤尾',:position => 1
    Menu.create :name => '蒜泥黄瓜',:position => 1

    Menu.create :name => '盐煎肉',:position => 2
    Menu.create :name => '醋熘土豆丝',:position => 2
    Menu.create :name => '凉拌木耳',:position => 2

    Menu.create :name => '小炒牛肉',:position => 3
    Menu.create :name => '烧茄子',:position => 3
    Menu.create :name => '麻婆豆腐',:position => 3

    Menu.create :name => '宫保鸡丁',:position => 4
    Menu.create :name => '干煸苦瓜',:position => 4
    Menu.create :name => '番茄蛋汤',:position => 4

    Menu.create :name => '蒜泥白肉',:position => 5
    Menu.create :name => '糖醋莲白',:position => 5
    Menu.create :name => '韭菜鸡蛋',:position => 5
  end
end
