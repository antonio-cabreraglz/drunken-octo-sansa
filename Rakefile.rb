require 'rubygems'

task :default => [:build]

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