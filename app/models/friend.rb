class Friend < ActiveRecord::Base
  attr_accessible :status, :to_user_id, :user_id
  belongs_to :to_user, :class_name => "User", :foreign_key => "to_user_id"
  belongs_to :user
end
