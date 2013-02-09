class Comment < ActiveRecord::Base
  attr_accessible :body, :status_update_id, :timestamp, :user_id
  belongs_to :status_update
  belongs_to :user 
end
