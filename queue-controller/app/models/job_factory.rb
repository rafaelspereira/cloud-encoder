class JobFactory
  def self.create_job(params)
    Job.create!(:input_video => params[:input_video], :duration => get_video_duration(params[:input_video]))
  end

  private
  def self.get_video_duration(path)
    line = `ffmpeg -i #{path} 2>&1 | grep Duration`
    duration = 0
    if line =~ /.*Duration.*(\d{2}):(\d{2}):(\d{2})\.(\d{2}).*/
      duration = (($1.to_i * 60 + $2.to_i) * 60 + $3.to_i) * 1000 + $4.to_i*10
    end
    duration
  end

end
