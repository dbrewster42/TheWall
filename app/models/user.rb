class User < ApplicationRecord
	has_many :messages
	has_many :comments
	validates :name, length: { minimum: 4}, uniqueness: true
end
