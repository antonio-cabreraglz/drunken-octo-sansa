require 'rubygems'
require 'w3c_validators'
require 'jshint/tasks'

include W3CValidators

task :default => [:install_juicer, :build]

task :install_juicer do
  sh "juicer install yui_compressor"
  sh "juicer install jslint"
  JSHint.config_path = "config/jshint.yml"

end

task :build do
  sh 'jekyll build'
end

task :deploy do
  Dir.chdir "_site"
  system "git status"
  system "git add ."
  system 'git commit -am "Deploy"'
  system 'git push' 
end

task :minify_css do
  Dir.glob("**/*.css").each do |f|
    sh "juicer merge #{f} --force"
  end
end


task :minify_js do
  Dir.glob("**/*.css").each do |f|
    sh "juicer merge #{f} --force"
  end
end


