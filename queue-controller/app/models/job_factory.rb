require 'app_config'

class JobFactory
  def self.create_job(params)
    metadata = get_video_metadata(params[:input_video])

    last_chunk = 0
    index = 0
    duration = metadata[:duration]
    reaspect_width = metadata[:height]/3*4

    Job.create!(:input_video => params[:input_video], :duration => duration)

    duration = duration / 1000

    #VIDEO CHUNK PROCESSING
    while last_chunk < duration do
      cmd = "mencoder -vf crop=#{reaspect_width}:#{metadata[:height]},scale=#{AppConfig.mencoder.video.output_width}:#{AppConfig.mencoder.video.output_height},harddup #{params[:input_video]} -ss #{last_chunk} -endpos #{AppConfig.chunk_size} #{AppConfig.mencoder.video.opts} -nosound -o #{"%04d" % index}.mp4"

      Task.create!(:command => cmd)

      index = index + 1
      last_chunk = last_chunk + AppConfig.split_time
    end

    #AUDIO PROCESSING
    cmd = "mencoder #{params[:input_video]} #{AppConfig.mencoder.audio.opts} -o audio.mp3"
    Task.create!(:command => cmd)

    #CHUNK MERGE
    cmd = "mencoder `seq -f %04g.mp4 0 #{index - 1}` -ovc copy -nosound -of lavf -lavfopts format=mp4,i_certify_that_my_video_stream_does_not_use_b_frames -o video.mp4"
    Task.create!(:command => cmd)

  end

  private
  def self.get_video_metadata(path)
    line = `/usr/bin/mplayer -identify -frames 0 #{path} 2>&1 | grep ID_`
    duration = 0
    width = 0
    height = 0
    if line =~ /.*ID_LENGTH=(\d+)\.(\d{2}).*/
      duration = $1.to_i * 1000 + $2.to_i * 10
    end
    if line =~ /.*ID_VIDEO_WIDTH=(\d+).*/
      width = $1
    end
    if line =~ /.*ID_VIDEO_HEIGHT=(\d+).*/
      height = $1
    end

    {:duration => Integer(duration), :width => Integer(width), :height => Integer(height)}
  end

end
