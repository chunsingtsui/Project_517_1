class Vote < ActiveRecord::Base
  attr_accessible :post_id, :user_id

  validates_presence_of :post_id
  validates_presence_of :user_id
end
