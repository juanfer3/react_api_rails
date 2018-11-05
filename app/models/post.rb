class Post < ApplicationRecord

  has_many :articles, inverse_of: :post, dependent: :destroy
  accepts_nested_attributes_for :articles, reject_if: :all_blank, allow_destroy: true

end
