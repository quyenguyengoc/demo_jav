class TestDetail < ApplicationRecord

  validates :user_answer, presence: true

  belongs_to :test
end
