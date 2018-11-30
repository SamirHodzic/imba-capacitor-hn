import Base from './base';

export tag Jobs < Base
	def setup
		@type = 'jobs'
		@maxPages = 1