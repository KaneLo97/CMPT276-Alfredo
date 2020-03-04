class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
  validates :artist, presence: true
  validates :album, presence: true
  validates :artist_id, presence: true
  has_reputation :votes, source: :user, aggregated_by: :sum
end
