import Base from './base';

export tag Newest < Base
	def setup
		@type = 'newest'
		@maxPages = 12