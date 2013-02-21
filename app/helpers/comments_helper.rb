module CommentsHelper

  def count_like_on_comment(comment)
    comment.likes.count(:all)
  end

  def check_like_on_comment(comment)
    like_comment = comment.likes.where("user_id=?", current_user.id)[0]
    if like_comment
      link = link_to 'Unlike', status_update_comment_like_comment_path(@status_update, comment, like_comment), :method => :delete, :class => "btn btn-link"
    else
      link = link_to 'Like', new_status_update_comment_like_comment_path(@status_update, comment), :class => "btn btn-link"
    end
    return link
  end

  def check_destroy_comment_authority(comment)
    if current_user.id == comment.user_id || current_user.id == comment.status_update.user_id
      return link_to 'Delete', [comment.status_update, comment], :confirm => 'Are you sure?', :method => :delete, :class => "btn btn-link"
    end
  end
  
end
