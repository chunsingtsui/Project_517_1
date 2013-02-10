class Post < ActiveRecord::Base
  attr_accessible :content, :category_id, :user_id, :post_id

  validates_presence_of :content
  validates_presence_of :category_id
  validates_presence_of :user_id

  def depth
    if self.post_id != nil
      return 1 + Post.find(self.post_id).depth
    else
      return 1;
    end
  end

  def getAllChildrenPosts
    Post.find_all_by_post_id(self.id, :order => "updated_at DESC")
  end

  def hasChildrenPost
    if Post.find_all_by_post_id(self.id).count() > 0
      true
    end
  end

  def listVoters
    Vote.find_all_by_post_id(self.id)
  end

  def getParentPostID
    if self.depth == 1
      return self.id
    else
      return Post.find(self.post_id).getParentPostID
    end
  end

end
