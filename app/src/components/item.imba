import { getItem } from '../services/api';
import { innerHtml } from '../services/shared';

export tag Item
	prop item

	def mount
		@item = await getItem(router.path.split('/')[2])
		Imba.commit

	def unmount
		item = null

	def goToUser user
		router.go("/#user/{user}")
	
	def collapse comment
		comment:collapse = !comment:collapse

	def allComments comments, child = false
		<ul.comment-child.closed=(comments:collapse && child)> for comment in comments:comments
			renderComment(comment)

	def renderComment comment
		<li.comment>
			<div.by>
				<span.username :click.goToUser(comment:user)>
					comment:user
				<span>
					" {comment:time_ago}"
			<div.text>
				innerHtml(comment:content)
			if comment:comments:length > 0
				<div.toggle.open=(!comment:collapse)>
					<a :click.collapse(comment)>
						!comment:collapse ? '[-]' : "[+] {comment:comments:length} {comment:comments:length > 1 ? 'replies' : 'reply'} collapsed"
				allComments(comment, true)

	def render
		<self>
			if item
				<div.item-container>
					<div.item-header>
						if item:domain
								<a href=item:url target="_blank">
									<h1> item:title
							else
								<a>
									<h1> item:title
						<span.host>
							" ({item:domain || item:url})"
						<p.meta>
							<span>
								"{item:points} points | "
							<span.username :click.goToUser(item:user)>
								"by {item:user}"
							<span>
								" {item:time_ago}"
					<div.item-comments>
						<p.comments-header>
							"{item:comments_count} comments" 
						allComments(item)
			else
				<div.loading-pulse>