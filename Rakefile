LIBS = %w[crystie rustie gotie cittie cpptie julitie ziggie dittie swiftie haskie] - %w[julitie]

task :build do
	sh 'bundle install'
	LIBS.each do |lib|
		cd "./#{lib}" do
			sh './build.sh'
		end
	end
end