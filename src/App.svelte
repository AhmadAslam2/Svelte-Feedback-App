<script>
	import { Router, Route } from "svelte-routing";
	import { SvelteToast } from '@zerodevx/svelte-toast'
	import HomePage from './HomePage.svelte';
	import FeedbackPage from './FeedbackPage.svelte';
	
	export let url = "";
</script>

<div class="app-container">
	<Router url = {url}>
		<Route path="feedbackpage"><FeedbackPage/></Route>
		<Route path="/"><HomePage /></Route>
	</Router>
	<SvelteToast />
</div>

