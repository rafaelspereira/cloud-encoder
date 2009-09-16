require 'spec/rake/verify_rcov'


Spec::Rake::SpecTask.new('run_specs') do |t|
    t.spec_opts = ['--options', "\"#{RAILS_ROOT}/spec/spec.opts\""]
    t.spec_files = FileList['spec/**/*/*_spec.rb', 'spec-integracao/**/*/*_spec.rb']
    t.rcov = true
    t.rcov_opts = lambda do
      IO.readlines("#{RAILS_ROOT}/spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
    end
  end

RCov::VerifyTask.new(:spec => 'run_specs') do |t|
  t.threshold = 100.0
end

