class Account < ApplicationRecord
  validates :name, presence: true
  has_many :entities
end
