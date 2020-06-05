class Bird < ApplicationRecord
  validates :name, :species, presence: true

end