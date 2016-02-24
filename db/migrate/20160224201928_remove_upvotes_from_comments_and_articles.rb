class RemoveUpvotesFromCommentsAndArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :upvotes
    remove_column :comments, :upvote
  end
end
