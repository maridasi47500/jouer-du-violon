class Cat < ApplicationRecord
  has_many :posts
  def self.findmycat(x)
    where("parameterize(name) like ?", x)[0]
  end
end
