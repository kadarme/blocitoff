class Item < ActiveRecord::Base
  belongs_to :list
  
  validates :name, length: { minimum: 1 }
  
  def days_left
    (DateTime.now.to_date - created_at.to_date).to_i
  end
end
