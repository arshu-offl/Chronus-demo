class ForumPost < ApplicationRecord
  validates :Content, presence: true, length: { maximum: 50 }
  has_many :upvotes, :foreign_key => :post_id
end
