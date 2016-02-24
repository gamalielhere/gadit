class Account < ActiveRecord::Base
  has_secure_password
  has_many :articles, :dependent => :destroy

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
