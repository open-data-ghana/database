# Define the required folders
required_folders = ['_database', '_scripts', '_data', '_tables']

# Check if top-level folders are present
def check_top_level_folders(folders)
  missing_folders = folders.reject { |folder| Dir.exist?(folder) }
  return if missing_folders.empty?

  puts "Missing folders: #{missing_folders.join(', ')}"
  puts "You have missing folders. Did you delete any existing folders?"
  exit(1)
end

# Check if at least one file exists within the required folders
def check_files_exist(folders)
  missing_files = []
  folders.each do |folder|
    next unless Dir.exist?(folder)

    files_in_folder = Dir.entries(folder).reject { |f| f =~ /^\./ }

    if files_in_folder.empty?
      missing_files << folder
    end
  end

  return if missing_files.empty?

  puts "No files found in the following folders: #{missing_files.join(', ')}"
  puts "Did you delete any file from any or all of these folders?"
  exit(1)
end

# Call the functions to check folder and file structure
check_top_level_folders(required_folders)
check_files_exist(required_folders)
