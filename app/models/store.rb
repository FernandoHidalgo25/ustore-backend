class Store < ApplicationRecord
    has_many :comments
    has_many :users, through: :reviews
end
