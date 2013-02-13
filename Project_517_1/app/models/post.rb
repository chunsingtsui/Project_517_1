class Post < ActiveRecord::Base
  attr_accessible :content, :category_id, :user_id, :post_id, :updated_at

  validates_presence_of :content
  validates_presence_of :category_id
  validates_presence_of :user_id

  # Number of ancestors that the post has + 1
  def depth
    if self.post_id != nil
      return 1 + Post.find(self.post_id).depth
    else
      return 1;
    end
  end

  # Gets all direct children of the current post
  def getAllChildrenPosts
    Post.find_all_by_post_id(self.id, :order => "updated_at DESC")
  end

  # Returns true if the current post has any children
  def hasChildrenPost
    if Post.find_all_by_post_id(self.id).count() > 0
      true
    else
      false
    end
  end

  # Gets all the votes for the current post
  def listVoters
    Vote.find_all_by_post_id(self.id)
  end

  # Gets the ID of the oldest ancestor of the current post
  def getParentPostID
    if self.depth == 1
      return self.id
    else
      return Post.find(self.post_id).getParentPostID
    end
  end

  # Returns the name of the creator of the current post
  def creatorName
    User.find(self.user_id).username
  end

  # Returns the name of the category of the current post
  def category
    Category.find(self.category_id).name
  end

  # Returns the number of votes for the post
  def numberOfVotes
    Vote.find_all_by_post_id(self.id).count()
  end

end
