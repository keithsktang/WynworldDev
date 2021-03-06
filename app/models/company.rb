class Company < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode

  has_many :employments
  has_many :users, through: :employments
  def full_address
    [street1, city, state, zip].compact.join(', ')
  end
  scope :search, ->(name) { where('name LIKE ?', "%#{name.capitalize}%") if name.present? }


end
