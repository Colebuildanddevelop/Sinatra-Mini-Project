class Gym < ActiveRecord::Base
    has_many :sessions
    has_many :fighters, through: :sessions
end