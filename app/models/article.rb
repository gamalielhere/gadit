class Article < ActiveRecord::Base
  belongs_to :account
  has_many :comments, :dependent => :destroy
  validates :title, presence: true

end
