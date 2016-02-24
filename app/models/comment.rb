class Comment < ActiveRecord::Base
  belongs_to :account
  belongs_to :article
end
