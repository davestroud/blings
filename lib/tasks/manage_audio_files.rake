desc "Manage audio files"

def deleteOldFile(filename, keepSeconds)

    puts "******* begin *******" 
    puts "Filename: #{filename}"
    puts "Now: #{Time.now} -- Ctime: #{File.stat(filename).ctime}"

    if (Time.now - File.stat(filename).ctime) > keepSeconds
      File.delete(filename)
      puts "*/*/*/* Delete: #{filename} */*/*/*"
    end

    puts "******* end *******" 
end

# task :manage_nonuser_audiofiles => :environment do
#   keepSeconds = 1000
#   Dir[(Rails.root.to_s + "/public/audio/non_user_audio/*")].each do |filename| 
#     deleteOldFile(filename, keepSeconds)
#   end
# end

# task :manage_test_audiofiles => :environment do
#   keepSeconds = 10000

#   Dir[(Rails.root.to_s + "/public/audio/test_audio/*")].each do |filename|
#     deleteOldFile(filename, keepSeconds)
#   end
# end

# task :manage_user_audiofiles => :environment do
#   keepSeconds = 5000
#   Dir[(Rails.root.to_s + "/public/audio/user_audio/*")].each do |filename| 
#     deleteOldFile(filename, keepSeconds)
#   end
# end


task :manage_all_audiofiles => :environment do
  
  keepSeconds = 3600 # 1 hour
  Dir[Rails.root.to_s + "/public/audio/non_user_audio/*"].each do |filename|
    deleteOldFile(filename, keepSeconds)
  end

  keepSeconds = 86400 # 1 day
  Dir[Rails.root.to_s + "/public/audio/user_audio/*"].each do |filename|
    deleteOldFile(filename, keepSeconds)
  end

  keepSeconds = 1800 # 30 minutes
  Dir[Rails.root.to_s + "/public/audio/test_audio/*"].each do |filename|
    deleteOldFile(filename, keepSeconds)
  end

end


task :clear_all_audiofiles => :environment do
  
  Dir[Rails.root.to_s + "/public/audio/non_user_audio/*"].each do |filename|
    File.delete(filename)
    puts "*/*/*/* Delete: #{filename} */*/*/*"
  end

  Dir[Rails.root.to_s + "/public/audio/user_audio/*"].each do |filename|
    File.delete(filename)
    puts "*/*/*/* Delete: #{filename} */*/*/*"
  end

  Dir[Rails.root.to_s + "/public/audio/test_audio/*"].each do |filename|
    File.delete(filename)
    puts "*/*/*/* Delete: #{filename} */*/*/*"
  end

end


