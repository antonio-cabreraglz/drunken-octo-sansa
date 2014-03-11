require 'rubygems'
require 'rake/testtask'

require 'w3c_validators'

include W3CValidators

task :default => [:install_juicer, :test, :minify_css, :minify_js, :build]

task :install_juicer do
  sh "juicer install yui_compressor"
  sh "juicer install jslint"
end

task :build do
  sh 'jekyll build'
end

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'

  # ensure the sample test file is included here
  test.test_files = FileList['test/*_test.rb']

  test.verbose = true
end


task :deploy do
  Dir.chdir "_site"
  system "git status"
  system "git add ."
  system 'git commit -am "Deploy From Travis"'
  system 'git push' 
end

task :minify_css do
  Dir.glob("**/*.css").each do |f|
    unless f.end_with? ".min.css" 
      sh "juicer merge #{f} --force"
    end
  end
end


task :minify_js do
  Dir.glob("**/*.js").each do |f|
    unless f.end_with? '.min.js' 
      sh "juicer merge #{f} --force"
    end
  end
end
