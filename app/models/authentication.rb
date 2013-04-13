# == Schema Information
#
# Table name: authentications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Authentication < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :provider, presence: true
  validates :uid, presence: true
  validates :uid, uniqueness: {scope: :provider}

  def self.authenticate(omniauth)
    authentication = where(omniauth.slice(:provider, :uid)).first_or_initialize
    return authentication if authentication.persisted?
    authentication.create_user(omniauth)
    authentication
  end

  def authenticated?
    user_id.present?
  end

  def create_user(omniauth)
    self.user = User.create(omniauth[:info].slice(:name,:email))
    save
  end
end
