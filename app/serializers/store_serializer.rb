class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :kind_of_shop
end
