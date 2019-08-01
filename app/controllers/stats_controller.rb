class StatsController < ApplicationController

  def index
    #lab notes this, not sure if it means change it to blank or leave it
    @post_count = Post.count
    @authors_count = Author.count
    @last_post = Post.last
  end
end
