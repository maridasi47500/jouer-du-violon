class Card < ApplicationRecord

  validates :nuance_id, uniqueness: { scope: [:mesure, :post_id], message: "The combination of nuance_id, mesure, and post_id must be unique" }
end
