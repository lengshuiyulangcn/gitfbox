require 'sinatra'
require 'json'
require "sinatra/reloader"
configure do
    @@presents ={"雑貨"=>21,"ゼロ・トン・ワンー君はゼロから何を生み出せるか"=>1,"速さは全てを解決するー「ゼロ秒思考」の仕事技"=>1,
    "保温水桶"=>3,"タオルギフトセット"=>2,"北海道白いブラックサンダー"=>2,"新宿銀の蔵９月の誕生石"=>1,"空气清新器"=>1,"スワロフスキーペン(做惩罚游戏)"=>2,"CK名刺入れ(惩罚游戏)"=>1} 
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

