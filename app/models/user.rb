class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true, presence: true

  def is_admin?
    self.admin
  end

  def admin_update(user, params)
    if params[:change_password_cb]
      user.update_with_password(params)
    else
      user.update_without_password(params)
    end
  end

end
