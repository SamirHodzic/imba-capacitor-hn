import { routes, ImbaLogo } from '../services/shared';

export tag Header
	prop menu
	prop items

	def mount
		@menu = false
		@items = routes

	def toggleMenu
		menu = !menu

	def goToPage url
		toggleMenu()
		window.scrollTo(0, 0)
		router.go(url)

	def render
		<self>
			<ul.nav-mobile>
				<li>
					'Imba-HN'
					<ImbaLogo>
				<li.menu-container>
					<input.menu-toggle id="menu-toggle" type="checkbox" checked=menu>
					<label.menu-button for="menu-toggle" :click.toggleMenu>
						<div.button-container .opened=(menu)>
							<div.bar1>
							<div.bar2>
							<div.bar3>
					<ul.menu-sidebar> for item in items
						<li.active=(router.hash.split('/')[0] == item:key) :click.goToPage(item:url)>
							<a>
								item:name