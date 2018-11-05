class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :articles, serializer: ArticleSerializer
end
