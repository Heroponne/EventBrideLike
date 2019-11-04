class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :event_subscription_send

  def event_subscription_send
  	UserMailer.event_subscription_email(self.user).deliver_now
  end
end
