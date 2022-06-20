<script>

  import {FeedbackStore} from '../stores'
  import {filterValue} from '../stores.js'

  let currentValue = 0;
  let filteredCount;
  filterValue.subscribe(value => {
    currentValue = value;
    filteredCount =  $FeedbackStore.filter(item => item.rating == currentValue).length
  })
    $: count = $FeedbackStore.length
    $: average = $FeedbackStore.reduce((a, {rating}) => a + rating, 0) / $FeedbackStore.length

    
</script>

<div class="feedback-stats">
  {#if currentValue != 0}
    <h4>{filteredCount} Reviews</h4>
    <h4>Ratings Average: {currentValue}</h4>
    {:else}
    <h4>{count} Reviews</h4>
    <h4>Ratings Average: {average.toFixed(1)}</h4>
  {/if}
</div>

<style>
  .feedback-stats {
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: rebeccapurple;
  }
</style>