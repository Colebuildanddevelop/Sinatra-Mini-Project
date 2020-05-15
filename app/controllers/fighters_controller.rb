class FightersController < ApplicationController
    
    get '/fighters' do
        @fighters = Fighter.all
        erb :'/fighters/index'
    end

    get '/fighters/new' do
        @gyms = Gym.all
        @fighters = Fighter.all
        erb :'/fighters/new'
    end

    post '/fighters' do
        fighter = Fighter.new(name: params[:fighter][:name], discipline: params[:fighter][:discipline])
 

        if !params[:gym][:name].empty?
            gym = Gym.create(params[:gym])
            #fighter.gyms << gym
        else
          gym = Gym.find(params[:fighter][:gym_id])
          #fighter.gyms = []
          #fighter.gyms << gym
        end
        fighter.save
        Session.create(date: params[:session][:date], gym_id: gym.id, fighter_id: fighter.id) 
        # binding.pry
        redirect "/fighters/#{fighter.id}"
    end

    get '/fighters/:id' do
        @fighter = current_fighter
        erb :'/fighters/show'
    end

    get '/fighters/:id/edit' do
        @fighter = current_fighter
        erb :'/fighters/edit'
    end

    patch '/fighters/:id' do
        fighter = current_fighter
        fighter.update(name: params[:fighter][:name], discipline: params[:fighter][:discipline])
        redirect "/fighters/#{fighter.id}"
    end

    delete '/fighters/:id' do
        fighter = current_fighter
        fighter.destroy
        redirect '/fighters'
    end

    def current_fighter
        Fighter.find(params[:id])
    end
end
