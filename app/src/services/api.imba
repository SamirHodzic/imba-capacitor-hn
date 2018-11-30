var base = 'https://api.hnpwa.com/v0'

export def getNews type,page
	let res = await window.fetch "{base}/{type}/{page}.json"
	res['status'] == 200 ? res.json : []

export def getUser username
	let res = await window.fetch "{base}/user/{username}.json"
	res['status'] == 200 ? res.json : {}

export def getItem item
	let res = await window.fetch "{base}/item/{item}.json"
	res['status'] == 200 ? res.json : {}