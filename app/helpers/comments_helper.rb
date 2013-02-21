module CommentsHelper

  def count_like_on_comment(comment)
    comment.likes.count(:all)
  end

  def check_like_on_comment(comment)
    comment.likes.where("user_id=?", current_user.id)[0]
  end

end
