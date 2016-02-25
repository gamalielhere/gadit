class Comment < ActiveRecord::Base
  belongs_to :account
  belongs_to :article

  acts_as_tree order: 'created_at DESC'
  acts_as_votable

  def total_votes_comment
    self.get_upvotes.size - self.get_downvotes.size
  end
end
