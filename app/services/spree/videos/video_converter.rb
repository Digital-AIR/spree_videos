module Spree
  module Videos
    class VideoConverter
      def convert!(video)
        process_video(video)
      end

      def create_thumbnail!(video)
        video_thumbnail(video)
      end

      private

      def process_video(video)
        movie = FFMPEG::Movie.new(video)
        path = "tmp/video-#{SecureRandom.alphanumeric(12)}.mp4"
        movie.transcode(path, { video_codec: 'libx264', audio_codec: 'aac' })
        converted_video = {io: File.open(path), filename: "video-#{SecureRandom.alphanumeric(12)}.mp4", content_type: 'video/mp4'}
      end

      def video_thumbnail(video)
        movie = FFMPEG::Movie.new(video)
        # duration = (movie.duration / 2).floor
        path = "tmp/thumbnail-#{SecureRandom.alphanumeric(12)}.jpg"
        movie.screenshot(path,  seek_time: 10)
        thumbnail = {io: File.open(path), filename: "thumbnail-#{SecureRandom.alphanumeric(12)}.jpg", content_type: 'image/jpg'}
      end
    end
  end
end