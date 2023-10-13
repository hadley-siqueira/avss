class Station < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many_attached :attachments, dependent: :destroy
  belongs_to :user
  has_many :circuit_stations
  has_many :circuits, through: :circuit_stations

  def score
    acc = 0

    questions.each do |q|
      acc += q.score
    end

    acc
  end
end
