import { getNews } from '../services/api';

export tag Base
	prop type
	prop items
	prop page
	prop maxPages

	def mount
		@page = +router.path.split('/')[2] || 1
		@items = await fetchData
		Imba.commit

	def fetchData
		await getNews(type, page)

	def changePage value
		value ? page++ : page--
		items = []

		router.go("/#!{type}/{page}")

		items = await fetchData
		window.scrollTo(0, 0)
		Imba.commit

	def goToUser user
		router.go("/#!user/{user}")

	def goToItem item
		router.go("/#!item/{item}")

	def render
		<self>
			if items && items:length > 0
				<ul.news-container> for item in items
					<li.news-item>
						<span.points>
							item:points
						<span.title>
							if item:domain
								<a href=item:url target="_blank">
									item:title
							else
								<a :click.goToItem(item:id)>
									item:title
							<span.host>
								" ({item:domain || item:url})"
						<br>
						<span.meta>
							<span.by>
								'by '
								<span.username :click.goToUser(item:user)>
									item:user
							<span.time>
								" {item:time_ago} | "
							<span.comments :click.goToItem(item:id)>
								"{item:comments_count} comments"
			else
				<div.loading-pulse>
			<div.footer-nav>
				<div.control.left.disabled=(page == 1) :click.changePage(false)>
					'Prev'
				<div.control.paging>
					"{page || 1} / {maxPages || 1}"
				<div.control.right.disabled=(page == maxPages) :click.changePage(true)>
					'Next'