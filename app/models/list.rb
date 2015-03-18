class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  
  validates :title, presence: true
  validates :user_id, presence: true
end
