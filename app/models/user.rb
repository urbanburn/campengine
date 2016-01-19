class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Can we put this on the same line as the other Devise opts?
  # Test this.
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :memberships
  has_many :camps, through: :memberships
end
