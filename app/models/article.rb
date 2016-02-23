class Article < ActiveRecord::Base
  belongs_to :account

  validates :title, presence: true

end
