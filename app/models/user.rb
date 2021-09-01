class User < ApplicationRecord
  after_commit :async_update
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def async_update
    UpdateUserJob.perform_later(self)
  end
end
