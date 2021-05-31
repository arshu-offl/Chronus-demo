class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 100 }
  belongs_to :forum_post, :foreign_key => :post_id
end
