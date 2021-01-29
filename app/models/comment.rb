class Comment < ApplicationRecord
  include Visible
  validates :body, length:{ minimum: 10 } ,presence: true
  validates :commenter ,presence: true
  belongs_to :article
end
