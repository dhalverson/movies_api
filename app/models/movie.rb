class Movie < ApplicationRecord
  validates :imdb_id, presence: true
  validates :title, presence: true
  validates :overview, presence: true
  validates :production_companies, presence: true
  validates :release_date, presence: true
  validates :budget, presence: true
  validates :revenue, presence: true
  validates :runtime, presence: true
  validates :language, presence: true
  validates :genres, presence: true
  validates :status, presence: true
  # serialize :genres, Array
  
  has_many :ratings, dependent: :destroy

  scope :filter_by_release_date, -> (year) { where('release_date LIKE ?', "#{year}%" )}

  def average_rating
    if ratings.blank?
      'No Ratings Available!'
    else
      (ratings.map(&:rating).sum / ratings.size).round(2)
    end
  end
end
