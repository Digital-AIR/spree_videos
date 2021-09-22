module SpreeVideos::Spree::Admin::BaseHelperDecorator
  def video_preview_link(video)
    button_link_to(
    "Preview Video",
	    spree_storefront_resource_url(video)+"/videos/#{video}",
	    class: 'btn-outline-secondary', icon: 'view.svg', id: 'admin_preview_video', target: :blank
	    )
  end

end

Spree::Admin::BaseHelper.prepend SpreeVideos::Spree::Admin::BaseHelperDecorator