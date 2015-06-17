# coding: utf-8
require 'sinatra/reloader'
require 'data_mapper'
require_relative 'word'
require 'erb'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://vagrant:vagrant@localhost/myapp')
# Sinatra Main controller
class MainApp < Sinatra::Base
  # Sinatra Auto Reload
  configure :development do
    register Sinatra::Reloader
  end

  get '/words' do
    @tweet = Word.all
    erb :index
  end

  post '/words' do
    Word.create(msg: params[:message])
    @tweet = Word.all
    erb :index
  end

end

