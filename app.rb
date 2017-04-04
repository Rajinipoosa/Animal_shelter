require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/animals_controller')
require_relative('controllers/owners_controller')
require_relative('controllers/adoption_controller')



get '/' do
  @animals = Animal.all()
  erb( :index )
end

