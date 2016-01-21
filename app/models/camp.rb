class Camp < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  has_many :memberships
  has_many :users, through: :memberships

  validates :creator, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :contact_email, presence: true
  validates :contact_name, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
