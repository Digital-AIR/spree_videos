module Spree
  module Videos
    class QueueRequests
      prepend Spree::ServiceModule::Base

      def call(video_id:, video_name:, content_type:)
        Spree::Videos::VideoJob.perform_later(video_id, video_name, content_type)
      end

    end
  end
end