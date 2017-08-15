def run_tests(emulator, junit_dir)
  system("appiumVersion=\"1.6.5\" deviceName=\"#{emulator}\" deviceOrientation=\"portrait\"  platformVersion=\"4.4\" platformName=\"Android\" browserName='' app=\"sauce-storage: grana.apk\" JUNIT_DIR=\"#{junit_dir}\" bundle exec rspec spec/main_spec.rb -r rspec_junit_formatter --format RspecJunitFormatter -o $CIRCLE_TEST_REPORTS/rspec/junit.xml")
end

task :samsung_galaxy_s3 do
  run_tests('Samsung Galaxy S3 Emulator', 'samsung_galaxy_s3')
end

task :samsung_galaxy_s4 do
  run_tests('Samsung Galaxy S4 Emulator', 'junit_reports/samsung_galaxy_s4')
end

task :samsung_galaxy_nexus do
  run_tests('Samsung Galaxy Nexus Emulator', 'junit_reports/samsung_galaxy_nexus')
end

task :google_nexus_7c do
  run_tests('Google Nexus 7C Emulator', 'junit_reports/google_nexus_7c')
end

task :lg_nexus_4 do
  run_tests('LG Nexus 4 Emulator', 'junit_reports/lg_nexus_4')
end

multitask :test_sauce => [
    :samsung_galaxy_s3,
    :samsung_galaxy_s4,
    :samsung_galaxy_nexus,
    :google_nexus_7c,
    :lg_nexus_4
  ] do
    puts 'Running automation'
end
