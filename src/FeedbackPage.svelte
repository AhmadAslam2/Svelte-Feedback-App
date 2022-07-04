<script>
	import {Link} from 'svelte-routing'
    import FeedbackForm from './components/FeedbackForm.svelte'
	import FeedbackList from './components/FeedbackList.svelte'
	import FeedbackStats from './components/FeedbackStats.svelte'
</script>
<main class="container">
	<Link to="/">
		<button class="button" >Home</button>
	</Link>
    <FeedbackForm />
	<FeedbackStats />
	<FeedbackList />
</main>

