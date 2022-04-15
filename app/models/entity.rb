class Entity < ApplicationRecord
    has_many :entity_users
    has_many :users, through: :entity_users
    belongs_to :account
end
