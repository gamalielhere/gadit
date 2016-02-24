class Article < ActiveRecord::Base
  belongs_to :account
  has_many :comments, :dependent => :destroy

  validates :title, presence: true

  acts_as_votable

  def total_votes
    self.get_upvotes.size - self.get_downvotes.size
  end
end
