# encoding: utf-8
AfterConfiguration do |config|
  #puts "Features dwell in #{config.feature_dirs}"
end

Before do |scenario|
  # Do something before each scenario.
  # The +scenario+ argument is optional, but if you use it, you can get the title,
  # description, or name (title + description) of the scenario that is about to be
  # executed
  #
  # e.g
  # put "Starting scenario: #{scenario.title}"
end

After do |scenario|
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods. 
  #
  # e.g
  # if scenario.failed?
  #   do something...
  # end
end

AfterStep do |scenario|
  # Do something after each step.
end