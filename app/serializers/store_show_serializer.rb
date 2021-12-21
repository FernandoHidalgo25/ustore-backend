class StoreShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :lat, :long, :image_url, :address, :kind_of_shop, :zip_code
end
