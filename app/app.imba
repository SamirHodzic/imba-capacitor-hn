import Router from'./src/services/router/src';

import Header from './src/components/header';
import News from './src/components/news';
import Newest from './src/components/newest';
import Ask from './src/components/ask';
import Show from './src/components/show';
import Jobs from './src/components/jobs';

import User from './src/components/user';
import Item from './src/components/item';

tag App
	def setup
		if router.hash
			router.go(router.path)
		else
			router.go('/#!newest/1')

	def render
		<self.container>
			<Header>
			<News route='/#!news'>
			<Newest route='/#!newest'>
			<Ask route='/#!ask'>
			<Show route='/#!show'>
			<Jobs route='/#!jobs'>
			<User route='/#!user'>
			<Item route='/#!item'>

Imba.mount <App>