require 'set'

LIBS = %w[crystie rustie gotie cittie cpptie julitie ziggie dittie swiftie haskie lltie].to_set

task :build do
  # sh 'bundle install'
  # sh 'pipenv install'
  LIBS.each do |lib|
    cd "./#{lib}" do
      sh './build.sh'
    end
  end
end

task :default => [:build]
