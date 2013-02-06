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

end
