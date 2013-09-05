Eat::Application.routes.draw do
  root :to => 'menu#index'

  match 'edit'     	=> 'menu#edit',  :via => [:get,:post]

  match 'add'      	=> 'menu#add',  :via => [:get,:post]
  match 'food_add'      	=> 'menu#food_add',  :via => [:get,:post]
  match 'update'   	=> 'menu#update',  :via => [:get,:post]
  match 'delete'   	=> 'menu#delete',  :via => [:get,:post]
  match 'food_delete'   	=> 'menu#food_delete',  :via => [:get,:post]
  match 'select'		=> 'menu#select',  :via => [:get,:post]
  match 'look'			=> 'menu#look',  :via => [:get,:post]
  match 'say'				=> 'menu#say',  :via => [:get,:post]

end
