class Petlisting < ApplicationRecord
  belongs_to :user
  belongs_to :species

  has_one_attached :picture

  validates :title, :description, presence: true

end