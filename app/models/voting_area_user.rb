class VotingAreaUser < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

end
