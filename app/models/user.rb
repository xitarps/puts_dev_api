class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def renew_session!
    self.update(session: SecureRandom.uuid,
                session_expires_at: Time.current + Session::DEFAULT_EXPIRATION)
  end
end
