# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

config.logger = RemoteSyslogLogger.new('logs3.papertrailapp.com', 27175)
