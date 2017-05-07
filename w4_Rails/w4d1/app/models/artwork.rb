class Artwork < ApplicationRecord
  validates :image_url, presence: true, uniqueness: true
  validates :title, uniqueness: {scope: :artist_id,
    message: 'Artist can\'t have artwork with the same title.'}

  belongs_to :user,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :viewers,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :viewers,
    source: :user
end
