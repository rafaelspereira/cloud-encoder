require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe JobFactory do

  before :each do
    Job.stub!(:create!)
    Task.stub!(:create!)
    @cmd = "mencoder -vf crop=160:120,scale=480:360,harddup spec/fixtures/video/video.flv -ss 0 -endpos 24.94 -ofps 30000/1001 -sws 2 -of lavf -lavfopts format=mp4,i_certify_that_my_video_stream_does_not_use_b_frames -ovc x264 -x264encopts psnr:bitrate=800:qcomp=0.6:qp_min=10:qp_max=51:qp_step=4:vbv_maxrate=1500:vbv_bufsize=2000:level_idc=30:dct_decimate:me=umh:me_range=16:keyint=250:keyint_min=25:nofast_pskip:global_header:nocabac:direct_pred=auto:nomixed_refs:trellis=1:bframes=0:threads=auto:frameref=1:subq=6 -nosound -o /tmp/0000.mp4"
    @cmd_audio = "mencoder spec/fixtures/video/video.flv -ovc raw -ofps 30000/1001 -oac mp3lame -af lavcresample=22050,channels=1 -lameopts cbr:br=32 -of rawaudio -o /tmp/audio.mp3"
    @cmd_merge = "mencoder `seq -f %04g.mp4 0 0` -ovc copy -nosound -of lavf -lavfopts format=mp4,i_certify_that_my_video_stream_does_not_use_b_frames -o /tmp/video.mp4"
    @cmd_mix = "mencoder /tmp/video.mp4 -audio-demuxer lavf -audiofile /tmp/audio.mp3 -ovc copy -oac copy -of lavf -lavfopts format=mp4,i_certify_that_my_video_stream_does_not_use_b_frames -o spec/fixtures/video/video_lowres.mp4"
  end

  it "deveria obter a duracao de um video" do
    Job.reflect_on_association(:tasks).should_not be_nil
  end

  it "deveria criar um job" do
    Job.should_receive(:create!).with(:input_video => "spec/fixtures/video/video.flv", :duration => 2820)
    JobFactory.create_job({:input_video => 'spec/fixtures/video/video.flv'})
  end

  it "deveria criar uma task de encoding para cada X segundos de video" do
    Task.should_receive(:create!).with(:command => @cmd)
    JobFactory.create_job({:input_video => 'spec/fixtures/video/video.flv'})
  end

  it "deveria criar uma task de encoding para o audio" do
    Task.should_receive(:create!).with(:command => @cmd_audio)
    JobFactory.create_job({:input_video => 'spec/fixtures/video/video.flv'})
  end

  it "deveria criar uma task de merge dos chunks" do
    Task.should_receive(:create!).with(:command => @cmd_merge)
    JobFactory.create_job({:input_video => 'spec/fixtures/video/video.flv'})
  end

  it "deveria criar uma task de mixing A/V" do
    Task.should_receive(:create!).with(:command => @cmd_mix)
    JobFactory.create_job({:input_video => 'spec/fixtures/video/video.flv'})
  end
end
