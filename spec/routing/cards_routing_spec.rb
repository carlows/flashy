require "rails_helper"

RSpec.describe CardsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/topics/1/cards").to route_to("cards#index", topic_id: "1")
    end

    it "routes to #show" do
      expect(get: "/topics/1/cards/1").to route_to("cards#show", topic_id: "1", id: "1")
    end

    it "routes to #create" do
      expect(post: "/topics/1/cards").to route_to("cards#create", topic_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/topics/1/cards/1").to route_to("cards#update", topic_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/topics/1/cards/1").to route_to("cards#update", topic_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/topics/1/cards/1").to route_to("cards#destroy", topic_id: "1", id: "1")
    end
  end
end
