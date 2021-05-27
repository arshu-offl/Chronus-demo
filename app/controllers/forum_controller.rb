class ForumController < ApplicationController
  include SessionCreate
  include ForumHelper

  def create

    if !logged_in?
      redirect_to login_path
    end

    @post = ForumPost.new(:Content => params[:content], :User_id => @user.id, :Hash_Tag => params[:hashtag])
    
    if @post.valid?
      @post.save
    end
    
    redirect_to forum_path
  end

  def show

    if !logged_in?
      redirect_to login_path
    end
    
    filter = ''
    order = 'created_at'
    @trending = getTrending()

    if params[:offset]
      offset = params[:offset].to_i * 3
    end

    if params[:hashtag]
      filter = "forum_posts.Hash_Tag == '#{params[:hashtag]}'"
    elsif params[:userid] 
      filter = "forum_posts.User_id == '#{params[:userid]}'"
    elsif params[:upvote] && params[:post_id]
      
      if !Upvote.where("user_id == #{@user.id} and post_id == #{params[:post_id]}")[0].nil?
        Upvote.where("user_id == #{@user.id} and post_id == #{params[:post_id]}").destroy_all
        redirect_to forum_path
        return 
      end

      temp = Upvote.new(user_id: @user.id, post_id: params[:post_id])

      if temp.valid?
        temp.save
      end

      redirect_to forum_path
    elsif params[:upvote]
      temp = Upvote.order('count_all DESC').group('post_id').offset(offset).count

      @posts = []
      temp.each do |post_id, count|
        @posts << ForumPost.find(post_id)
      end
      
      return
    end

    @posts = getPosts('created_at', offset, filter)
  end
end
