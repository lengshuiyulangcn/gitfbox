require 'sinatra'
require 'json'
require "sinatra/reloader"
configure do
    @@presents ={"电饭锅"=>9,"水壶"=>8} 
end
set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
   gifts = @@presents.select{|k,v| v>0}.keys
   redirect '/gameover' if gifts.length == 0
   @gift_name = gifts[Random.rand(gifts.length)]
   @@presents[@gift_name]-=1
   @left_number = @@presents.values.inject(:+)

  erb :index
end

get '/gameover' do
 send_file 'gameover.html' 
end

