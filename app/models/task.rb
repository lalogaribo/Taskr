class Task < ApplicationRecord
  validates :content, presence: true, length: {minimum: 5, macimum: 255}
end