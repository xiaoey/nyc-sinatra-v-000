require_relative 'application_controller'
class FiguresController < ApplicationController

get '/figures' do
  @figures = Figure.all
  erb :'/figures/index'
end

get '/figures/:id' do
end

post '/figures/:id' do
end

get '/figures/:id/edit' do
  erb :'/figures/edit'
end

end
