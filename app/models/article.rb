class Article < ActiveRecord::Base
  belongs_to :account
  has_many :comments, :dependent => :destroy
  validates :title, presence: true

  after_initialize :set_upvotes_to_zero

  def set_upvotes_to_zero
    self.upvotes ||= 0
  end
end
