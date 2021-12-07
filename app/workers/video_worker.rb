class VideoWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(video_id, video_name, content_type)
    if content_type == "video/mp4"
      video_thumbnail(video_id, video_name)
      File.delete('tmp/'+ video_name.to_s)    
    else
      video_convert(video_id, video_name)
      video_thumbnail(video_id, video_name)
      File.delete('tmp/'+ video_name.to_s)    
    end
  end

  private

  def video_convert(video_id, video_name)
    @video = Spree::Video.find(video_id)
    movie = FFMPEG::Movie.new('tmp/'+ video_name.to_s)
    path = "tmp/video-#{SecureRandom.alphanumeric(12)}.mp4"
    movie.transcode(path, { video_codec: 'libx264', audio_codec: 'aac' })
    converted_video = {io: File.open(path), filename: "video-#{SecureRandom.alphanumeric(12)}.mp4", content_type: 'video/mp4'}
    @video.create_upload_video(attachment: converted_video)
    File.delete(path)
  end

  def video_thumbnail(video_id, video_name)
    @video = Spree::Video.find(video_id)
    movie = FFMPEG::Movie.new('tmp/'+ video_name.to_s)
    path = "tmp/thumbnail-#{SecureRandom.alphanumeric(12)}.jpg"
    movie.screenshot(path,  seek_time: 10)
    thumbnail = {io: File.open(path), filename: "thumbnail-#{SecureRandom.alphanumeric(12)}.jpg", content_type: 'image/jpg'}
    @video.create_thumbnail(attachment: thumbnail)
    File.delete(path)
  end

end
