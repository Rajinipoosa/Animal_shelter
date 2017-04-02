require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
require_relative( '../models/adoption.rb' )


get '/owners' do
  @owners = Owner.all()
  @animal = Animal.all()
  erb ( :"owners/index" )
end

get '/owners/new' do
  @owners = Owner.all()
  @animal = Animal.all()
  erb (:"/owners/new")
  end