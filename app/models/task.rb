class Task < ApplicationRecord
  validates :content, presence: true, length: {minimum: 5, maximum: 255}
  belongs_to :user
end