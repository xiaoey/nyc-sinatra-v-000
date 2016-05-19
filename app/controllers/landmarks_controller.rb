require_relative 'application_controller'
class LandmarksController < ApplicationController

get '/landmarks' do
  @landmarks = Landmark.all
  erb :'/landmarks/index'
end

end
