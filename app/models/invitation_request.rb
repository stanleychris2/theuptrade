class InvitationRequest < ActiveRecord::Base
  validates :name, :presence => { message: "can't be blank" }
  validates :email, :format => { :with => /\A[^@ ]+@[^@ ]+\.[^@ ]+\Z/ }
  validates :memo, presence: true

  before_create :create_code
  #after_create :send_email
  #^ this otherwise sends an email twice... 
  
  def self.verified_count
    InvitationRequest.where(:is_verified => true).count
  end

  def create_code
    self.code = SecureRandom.hex(6)
  end

  def markeddown_memo
    Markdowner.to_html(self.memo)
  end

  def send_email
    InvitationRequestMailer.invitation_request(self).deliver
  end
end
