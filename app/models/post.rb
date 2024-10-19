class Post < ApplicationRecord
belongs_to :cat
paginates_per 16
has_many :myfiles
accepts_nested_attributes_for :myfiles, allow_destroy: true
has_many :memos
accepts_nested_attributes_for :memos, allow_destroy: true
validates_uniqueness_of :title
    has_many :cards, dependent: :destroy
  accepts_nested_attributes_for :cards, allow_destroy: true

  has_many :nuances, through: :cards




def self.firstpartition
catid=Cat.where("name like ?","%partition%")[0].try(:id)
self.where(cat_id:catid).order(created_at: :desc).limit(1).offset(0)
end
def self.threefirstpartition
catid=Cat.where("name like ?","%partition%")[0].try(:id)
self.where(cat_id:catid).order(created_at: :desc).limit(3).offset(1)
end
def self.myfirst
self.order(created_at: :desc).limit(1).offset(0)
end
def self.fourfirst
self.order(created_at: :desc).limit(4).offset(1)
end
  def self.findmypost(x)
        where("parameterize(title) like ?", x)[0]
  end
end
