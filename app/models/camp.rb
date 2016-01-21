class Camp < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  has_many :memberships
  has_many :users, through: :memberships

  validates :creator, presence: true
end
