<script>
	import FeedbackForm from './components/FeedbackForm.svelte'
	import FeedbackList from './components/FeedbackList.svelte'
	import FeedbackStats from './components/FeedbackStats.svelte'
	import Filter from './components/Filter.svelte'
	import { SvelteToast } from '@zerodevx/svelte-toast'
</script>

<main class="container">

	<FeedbackForm />
	<Filter />
	<FeedbackStats />
	<FeedbackList />
	<SvelteToast />

</main>
