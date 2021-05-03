require 'bundler'
Bundler.require

local_dir =File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(local_dir)

require 'sinatra'


get '/hello' do
 '<h1>Hello world ! </h1>'
end

get '/bonjour' do
  '<h1>Bonjour, monde !</h1>'
 end