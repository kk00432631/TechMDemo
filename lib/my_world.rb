require 'yaml'

class EnvironmentVariable
	
	def env
		@env = ENV['penv']
	end

	def axway_is_ready
		@axway_is_ready = ENV['paxway_is_ready']
	end
end

class YamlConfig

	def initialize(env_variable)
		@axway_is_ready = env_variable.axway_is_ready

		env_level = env_variable.env
		if env_level.to_s.empty?
			@env = YAML.load_file('config/environment_local.yml')
		else
			@env = YAML.load_file("config/environment_#{env_level}.yml")
		end
	end

	def all_config
		@env
	end

	def csl_url
		@env['default_csl_url']
	end

	def axway_csl_url
		if !!@axway_is_ready && @axway_is_ready.include?('true')
			return @env['axway_csl_url']

		else
			return @env['default_csl_url']

		end
	end

	def account_details_csl_url
		return @env['account_details_csl_url']
	end

	def account_summary_details_csl_url
		return @env['account_summary_details_csl_url']
	end

	def profile_details_csl_url
		return @env['profile_details_csl_url']
	end

end

module MyWorld

	def environment_variable
		@env_var ||= EnvironmentVariable.new
	end

	def environment
		@env ||= YamlConfig.new(environment_variable)
	end

end