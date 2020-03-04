class Artist < ApplicationRecord
  has_many :posts
  validates :spotify_id, presence: true
end
