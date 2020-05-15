class SessionsController < ApplicationController

  get '/sessions' do 
    @sessions = Session.all
    erb :'/sessions/index'
  end

  get '/sessions/new' do
    @gyms = Gym.all
    @fighters = Fighter.all
    erb :'sessions/new'
  end

  get '/sessions/:id' do
    @session = current_session
    erb :'/sessions/show'
  end

  get '/sessions/:id/edit' do
    @gyms = Gym.all
    @fighters = Fighter.all
    @session = current_session
    erb :'/sessions/edit'
  end

  patch '/sessions/:id' do
    session = current_session
    session.update(params[:session])
    redirect "/sessions/#{session.id}"
  end

  post '/sessions' do 
    session = Session.create(params[:session])
    redirect "/sessions/#{session.id}"
  end

  delete '/sessions/:id' do
    session = current_session
    session.destroy
    redirect '/sessions'
  end

  def current_session
    Session.find(params[:id])
  end
end
