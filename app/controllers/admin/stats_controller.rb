class Admin::StatsController < ApplicationController
#added Admin:: to StatController after it was moved from under /controllers/ to /controllers/admin/
  def index
    @post_count = Post.count
    @authors_count = Author.count
    @last_post = Post.last
  end
end
