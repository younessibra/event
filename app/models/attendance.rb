class Attendance < ApplicationRecord
  after_create :confirmation_send

  belongs_to :user
  belongs_to :event

  validates :stripe_customer_id, uniqueness: true

  def confirmation_send
    AttendanceMailer.attendee_email(self).deliver_now
  end
end
