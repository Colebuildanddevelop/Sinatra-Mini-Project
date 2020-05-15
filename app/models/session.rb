class Session < ActiveRecord::Base 
  belongs_to :fighter
  belongs_to :gym

end