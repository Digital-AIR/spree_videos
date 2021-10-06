require 'rails_helper'

RSpec.describe "video_reviews/show", type: :view do
  before(:each) do
    @video_review = assign(:video_review, VideoReview.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
