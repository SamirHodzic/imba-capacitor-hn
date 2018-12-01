export let routes = [
	{
		name: 'Newest',
		url: '/#!newest/1',
		key: '#!newest'
	},
	{
		name: 'News',
		url: '/#!news/1',
		key: '#!news'
	},
	{
		name: 'Ask',
		url: '/#!ask/1',
		key: '#!ask'
	},
	{
		name: 'Show',
		url: '/#!show/1',
		key: '#!show'
	},
	{
		name: 'Jobs',
		url: '/#!jobs/1',
		key: '#!jobs'
	}
]

export def innerHtml value
	Imba.createElement('span').setHtml(value).end()