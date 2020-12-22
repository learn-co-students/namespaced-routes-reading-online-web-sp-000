class Admin::StatsController < ApplicationController
  # namespacing for a module 
  # views for this module need to be in views/admin/stats
  # if there were another admin module controller, it would be views/admin/new_controller

  def index
    @post_count = Post.count
    @authors_count = Author.count
    @last_post = Post.last
  end
end
