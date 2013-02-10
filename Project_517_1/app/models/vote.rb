class Vote < ActiveRecord::Base
  attr_accessible :post_id, :user_id

  validates_presence_of :post_id
  validates_presence_of :user_id

  def exists
    votes = Vote.find_all_by_user_id(self.user_id)
    for v in votes
      if v.post_id == self.post_id
        return true
      end
    end

    return false
  end

  def delete
    votes = Vote.find_all_by_user_id(self.user_id)
    for v in votes
      if v.post_id == self.post_id
        v.destroy
      end
    end
  end


end
