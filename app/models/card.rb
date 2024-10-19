class Card < ApplicationRecord

  validates :nuance_id, uniqueness: { scope: [:measure, :post_id], message: "The combination of nuance_id, mesure, and post_id must be unique" }

  belongs_to :post
  belongs_to :nuance


  validates :measure, presence: true
end
