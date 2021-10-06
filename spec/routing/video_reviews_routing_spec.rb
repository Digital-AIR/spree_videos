require "rails_helper"

RSpec.describe VideoReviewsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/video_reviews").to route_to("video_reviews#index")
    end

    it "routes to #new" do
      expect(get: "/video_reviews/new").to route_to("video_reviews#new")
    end

    it "routes to #show" do
      expect(get: "/video_reviews/1").to route_to("video_reviews#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/video_reviews/1/edit").to route_to("video_reviews#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/video_reviews").to route_to("video_reviews#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/video_reviews/1").to route_to("video_reviews#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/video_reviews/1").to route_to("video_reviews#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/video_reviews/1").to route_to("video_reviews#destroy", id: "1")
    end
  end
end
