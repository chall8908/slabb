module PostsHelper
  def display_user(post)
    render 'user', user: post.creator
  end
end
