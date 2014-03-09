require 'rubygems'

task :default => [:build]

task :build do
  sh 'jekyll build'
end

task :deploy do
  Dir.chdir "_site"
  system 'echo "Working directory: "'
  system "pwd"
  system "Files"
  system "ls"
  system "git init"
  system 'git remote add origin https://github.com/antonio-cabreraglz/drunken-octo-sansa.git'
  system 'git config credential.helper "store --file=.git/credentials"'
  system 'echo "https://${GH_TOKEN}:@github.com" > .git/credentials'
  system "git checkout -b build"
  system "git add ."
  system 'git commit -am "build"'
  
  system 'git status'
=begin  
  File.open('.git/credentials', 'w') do |f|
    f.write("https://#{ENV['GH_TOKEN']}:@github.com")
  end
=end
  system "git fetch origin"
  system "git checkout master"
  system 'git checkout build'
  system "git merge -s ours master"
  system "git checkout master"
  system "git merge build"
  system "git push"
end