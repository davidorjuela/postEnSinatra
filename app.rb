require 'sinatra'
require 'sinatra/activerecord'
set :database, "sqlite3:project-name.sqlite3"
Dir[__dir__+"/models/*.rb"].each {|file| require file }

friends=[{name: "Alejandro", last_name: "Perez", age: "31"}]

#get '/' do
#  erb :index
#end

get '/' do
  @friends=friends
  erb :index
end

post '/friends' do
#  if(params[:name].length>0 && params[:last_name].length>0 && params[:age].to_i>0 && params[:age].to_i.is_a? Integer)
  #if params[:friend[:name]]=~/[A-Z]{2,20}/ix && params[:friend[:last_name]]=~/[A-Z]{2,20}/ix && params[:friend[:age]]=~/\d/ && params[:friend[:age]].to_i>0 && params[:friend[:age]].to_i<120
  #validar << params[:friend]
  #if params[:friend[:name]].length>0
    friends << params[:friend]
    @friends=friends
  #end
  redirect '/'
end

get '/friends/new_friend' do
  erb :new_friend
end

get '/friends/:id' do
  index=params[:id].to_i
  @friend=friends[index]
  erb :show
end

get '/friends/:id/edit' do
  index=params[:id].to_i
  @friend=friends[index]
  @index=index
  erb :edit
end
