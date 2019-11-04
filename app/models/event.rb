class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: "User"

  validate :start_date_cannot_be_in_the_past, :duration_must_be_multiple_of_five
  validates :start_date,
    presence: true
  validates :duration,
    presence: true,
    numericality: { greater_than: 0 }
  validates :title,
    presence: true,
    length: { in: 5..140 }
  validates :description,
    presence: true,
    length: { in: 20..1000 }
  validates :price,
    presence: true,
    numericality: { in: 1..1000 }
  validates :location,
    presence: true

  def start_date_cannot_be_in_the_past
  	if start_date < Date.today
  	  errors.add(:start_date, "Ne peut pas commencer dans le passé")
  	end
  end

  def duration_must_be_multiple_of_five
  	if duration % 5 != 0
  	  errors.add(:duration, "Doit être un multiple de 5")
  	end
  end

end
