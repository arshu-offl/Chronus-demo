class Upvote < ApplicationRecord
  belongs_to :forum_post, :foreign_key => :post_id
end
