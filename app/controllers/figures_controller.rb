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
  @figure = Figure.create(:name => params[:figure][:name])
  @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
  @figure.titles << Title.find_or_create_by(params[:title])
  @figure.save
  redirect "/figures/#{@figure.id}"
end

get '/figures/:id' do
  @figure = Figure.find_by_id(params[:id])
  erb :'/figures/show'
end

get '/figures/:id/edit' do
  @landmark = Landmark.find_by_id(params[:id])
  erb :'/figures/edit'
end

post '/figures/:id' do
  @figure = Figure.find_by_id(params[:id])
  @figure.titles.clear
  @figure.landmarks.clear
  @figure.update(:name => params[:figure][:name])
  create_or_update_landmark(params[:figure][:landmark_ids], params[:landmark][:name])
  create_or_update_title(params[:figure][:title_ids], params[:title][:name])
  redirect "/figures/#{@figure.id}"
end

end
