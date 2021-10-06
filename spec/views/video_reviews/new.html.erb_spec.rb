require 'rails_helper'

RSpec.describe "video_reviews/new", type: :view do
  before(:each) do
    assign(:video_review, VideoReview.new())
  end

  it "renders new video_review form" do
    render

    assert_select "form[action=?][method=?]", video_reviews_path, "post" do
    end
  end
end
