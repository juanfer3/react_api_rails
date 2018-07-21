class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :username, :password, :role, :created_at, :updated_at, :last_loginattributes :id
end
