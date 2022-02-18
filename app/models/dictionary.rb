class Dictionary < ApplicationRecord
  validates :word, presence: true, uniqueness: true
end
