class Post < ActiveRecord::Base
  attr_accessible :content, :category_id, :user_id, :post_id

  validates_presence_of :content
  validates_presence_of :category_id
  validates_presence_of :user_id
end
