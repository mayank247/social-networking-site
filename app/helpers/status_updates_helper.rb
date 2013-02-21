module StatusUpdatesHelper
  
  def count_like_on_status(status_update)
    status_update.likes.count(:all)
  end

  def check_like_on_status(status_update)
    status_update.likes.where(:user_id => current_user.id)[0]
  end
  
end
