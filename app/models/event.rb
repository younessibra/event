class Event < ApplicationRecord
  belongs_to :manager, class_name: "User", required: false
  has_many :attendances
  has_many :users, through: :attendances
  has_one_attached :picture
  
  validate :duration_modulo_5
  validate :start_date_cannot_be_in_the_past

  validates :start_date, presence: true 
   
  validates :duration, presence: true
  
  validates :description, presence: true, length: { in: 20..1000, message: "description need 20 car. min and 1000 car. max"} 
  
  validates :title, presence: true, length: { in: 5..140, message: "title need 5 car. min and 140 car. max"} 
  
  validates :price, presence: true, numericality: { in: 1..1000, }
  
  validates :location, presence: true

  # variable pour afficher date/heure de fin pour view events/show 
  def end_date
		return (self.start_date + self.duration*60)
  end
 
  private
  def start_date_cannot_be_in_the_past
    if start_date < Time.now
      errors.add(:start_date, 'The start_date can not in the past !')
    end
  end

  def duration_modulo_5
    if !(duration % 5 == 0 && duration >= 5)
      errors.add(:duration, 'Must be a multiple of 5')
    end
  end
end
