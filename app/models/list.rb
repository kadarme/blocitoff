class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  
  validates :title, presence: true
  validates :user_id, presence: true
end
