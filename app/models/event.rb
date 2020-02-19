class Event < ApplicationRecord
  
  validates :start_date, presence: true 
   
  validates :duration, presence: true
  
  validates :description, presence: true
  
  validates :title, presence: true
  
  validates :price, presence: true, numericality: { in: 1..1000, }
  
  validates :location, presence: true

end
