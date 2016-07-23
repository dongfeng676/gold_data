log_file = File.join(Rails.root, 'log', 'gold.log')
system("touch #{log_file}") unless File.exist? log_file
AppLog = Logger.new(log_file)

