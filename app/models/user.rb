# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#  admin      :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :authentications
  validates :name, presence: true
end
