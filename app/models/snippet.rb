class Snippet < ActiveRecord::Base
  extend FriendlyId
  validates :poster, presence: true, length: { maximum: 40 }
  validates :content, presence: true
  belongs_to :syntax
  belongs_to :user
  friendly_id :token
end
