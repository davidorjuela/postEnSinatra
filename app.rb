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
    friends << params
    @friends=friends
#  end
  redirect '/'
end
