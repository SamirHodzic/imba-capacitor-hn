import Base from './base';

export tag News < Base
	def setup
		@type = 'news'
		@maxPages = 10