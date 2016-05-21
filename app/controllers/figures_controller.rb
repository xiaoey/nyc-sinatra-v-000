require_relative 'application_controller'
class FiguresController < ApplicationController

get '/figures' do
  @figures = Figure.all
  erb :'/figures/index'
end

get '/figures/new' do
  erb :'/figures/new'
end

post '/figures' do
  @figure = Figure.create(params[:figure])

  if !params[:landmark][:name].empty?
  @figure.landmarks << Landmark.create(name: params[:landmark][:name])
  end

  if !params[:title][:name].empty?
  @figure.titles << Title.create(name: params[:title][:name])
  end
end

get '/figures/:id' do
  @figure = Figure.find_by_id(params[:id])
  erb :'/figures/show'
end

get '/figures/:id/edit' do
  @figure = Figure.find_by_id(params[:id])
  erb :'/figures/edit'
end

post '/figures/:id' do
  @figure = Figure.find_by_id(params[:id])
  @figure.titles.clear
  @figure.landmarks.clear
  @figure.update(:name => params[:figure][:name])
  @figure.landmarks << Landmark.find_or_create_by(params[:landmark][:name])
  @figure.titles << Title.find_or_create_by(params[:title][:name])
  @figure.save
  redirect "/figures/#{@figure.id}"
end

end
