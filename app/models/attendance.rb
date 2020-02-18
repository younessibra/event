class Attendance < ApplicationRecord
  after_create :notify_mail
  belongs_to :user
  belongs_to :event

  def notify_mail
    UserMailer.notify_attendance(user).deliver_now
  end

  validates :stripe_customer_id, uniqueness: true
end
