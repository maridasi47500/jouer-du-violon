class Memo < ApplicationRecord
  has_many :stuffs
  belongs_to :post
  accepts_nested_attributes_for :stuffs, allow_destroy: true
end
