require('sinatra')
# require('sinatra/contrib/all') if development?
require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/vet')

# index - animals listing page

get '/animals' do
  @animals = Animal.all
  erb(:"animals/index")
end

# new - animals register page

get '/animals/register' do
  @owners = Owner.all
  @vets = Vet.all
  erb (:"animals/new")
end

post '/animals/register' do
  @animal = Animal.new(params)
  @animal.save()
  erb (:"animals/create")
end

# show - animals detail page

get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb (:"animals/show")
end

# edit and update - edit animal

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  @owners = Owner.all
  @vets = Vet.all
  erb (:"animals/edit")
end

post '/animals/:id/edit' do
  Animal.new(params).update()
  erb (:"animals/create")
end
