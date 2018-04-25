class Like < ApplicationRecord
  belongs_to :game
  accepts_nested_attributes_for :game
  after_create :send_like_email

  def send_like_email
    ApplicationMailer.like_email(self).deliver_now
  end

end
