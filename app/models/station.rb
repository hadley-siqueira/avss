class Station < ApplicationRecord
  has_many :questions, dependent: :destroy
end
