module ForumHelper

  def getPosts(order_by = 'created_at', offset = 0, clause = '')
    @posts = ForumPost.order("forum_posts.#{order_by} desc").limit(3).offset(offset).where(clause)
  end

  # CovidCase.order("count_all DESC").group(:location).count.limit(5)

  def getTrending()
    @trending = ForumPost.order("count_all desc").limit(5).group(:Hash_Tag).count
  end
end
