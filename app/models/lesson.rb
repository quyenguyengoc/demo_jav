class Lesson < ApplicationRecord

  validates :number, presence: true, uniqueness: true
  validates :number, numericality: { greater_than: 0 }, if: lambda { self.number.present? }

  has_many :words
end
