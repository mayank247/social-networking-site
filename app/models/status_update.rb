class StatusUpdate < ActiveRecord::Base
  attr_accessible :body, :timestamp, :to_user_id, :user_id
  belongs_to :user
  belongs_to :to_user_update, :class_name => "User", :foreign_key => "to_user_id"
end
