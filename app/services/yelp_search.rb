class YelpSearch

    attr_reader :response, :businesses, :markets
  
    def initialize(location, kind_of_shop="lunch", limit=50)
      url = "https://api.yelp.com/v3/businesses/search?markets"
      params = {
        term: kind_of_shop,
        location: location,
        limit: limit,
      }
  
      response = HTTP.auth("Bearer #{ENV["YELP_API_KEY"]}").get(url, params: params)
      @response = response.parse
      @businesses = @response["businesses"]
      @markets = @response["markets"]
    end
  
    def to_stores
      store_ids = self.businesses.map do |business|
        Store.find_or_create_by(yelp_id: business["id"]) do |store|
          store.name = business["name"]
          store.url = business["url"]
          store.lat = business["coordinates"]["latitude"]
          store.long = business["coordinates"]["longitude"]
          store.image_url = business["image_url"]
          store.address = business["location"]["display_address"].join(", ")
          store.zip_code = business["location"]["zip_code"].to_i
          store.kind_of_shop = business["categories"].map{|hash| hash["title"]}.join(", ")
        end.id
      end
      Store.where(id: store_ids)
    end
  
  end