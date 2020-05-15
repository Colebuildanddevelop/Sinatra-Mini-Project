class GymsController < ApplicationController

  get '/gyms' do 
    @gyms = Gym.all
    erb :'/gyms/index'
  end

  get '/gyms/new' do
    @gyms = Gym.all
    erb :'/gyms/new'
  end

  post '/gyms' do
    gym = Gym.create(params[:gym])
    redirect "/gyms/#{gym.id}"
  end

  get '/gyms/:id' do
    @gym = current_gym
    erb :'/gyms/show'
  end

  get '/gyms/:id/edit' do
    @gym = current_gym
    erb :'/gyms/edit'
  end

  patch '/gyms/:id' do
    gym = current_gym
    gym.update(name: params[:gym][:name], address: params[:gym][:address])
    redirect "/gyms/#{gym.id}"
  end

  delete '/gyms/:id' do
    gym = current_gym
    gym.destroy
    redirect '/gyms'
  end

  def current_gym
      Gym.find(params[:id])
  end
end
