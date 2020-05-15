class Fighter < ActiveRecord::Base 
  has_many :sessions
  has_many :gyms, through: :sessions

end 