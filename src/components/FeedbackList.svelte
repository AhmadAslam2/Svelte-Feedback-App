<script>
  import {FeedbackStore} from '../stores'
  import { fade, scale } from 'svelte/transition'
  import FeedbackItem from './FeedbackItem.svelte'
  import {filterValue} from '../stores.js'

  let _value = 0;

  filterValue.subscribe(value => {
    _value = value;
  })
</script>

{#if _value === 0 }      
  {#each $FeedbackStore as fb (fb.id)}
    <div in:scale out:fade="{{ duration: 500 }}">
      <FeedbackItem item={fb} />
    </div>
  {/each}
  {:else}
    {#each $FeedbackStore as fb (fb.id)}
      {#if fb.rating === _value}  
        <div in:scale out:fade="{{ duration: 500 }}">
          <FeedbackItem item={fb} />
        </div>
      {/if}
    {/each}
{/if}
