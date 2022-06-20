<script>
  import {FeedbackStore} from '../stores'
  import Card from './Card.svelte'
  import Button from './Button.svelte'
  import RatingSelect from './RatingSelect.svelte'
  import { toast } from '@zerodevx/svelte-toast'

  export let updateItemId;
  export let toggleOverlay;
  export let update = false;

  let text = ''
  let rating = 10
  let btnDisabled = true
  let min = 0
  let message

  const handleSelect = e => rating = e.detail

  const handleInput = () => {
    if(text.trim().length <= min) {
      message = `Text must be at least ${min} characters`
      btnDisabled = true
    } else {
      message = null
      btnDisabled = false
    }
  }

  const handleSubmit = () => {
    if(text.trim().length > min) {

      const newFeedback = {
        id: $FeedbackStore.length+1,
        text,
        rating: +rating
      }

      FeedbackStore.update((currentFeedback) => {
        return [newFeedback, ...currentFeedback]
      })
      console.log($FeedbackStore)
      text = ''
      toast.push('Thank you for the feedback!', {
        theme: {
          '--toastBackground': '#48BB78',
          '--toastBarBackground': '#2F855A'
        }
      })
    }
  }
  const handleUpdate = () => {
    const updatedFeedback = {
      id: updateItemId,
      text,
      rating: rating
    }
    const index = $FeedbackStore.map(e => e.id).indexOf(updateItemId);
    $FeedbackStore[index] = updatedFeedback;
    update = false;
    toggleOverlay();

    toast.push('Feedback Updated!', {
        theme: {
          '--toastBackground': '#48BB78',
          '--toastBarBackground': '#2F855A'
        }
      })
    
  }
</script>


<Card>
  <header>
    <h2>How would you rate your service with us?</h2>
  </header>
<form on:submit|preventDefault={update ? handleUpdate : handleSubmit}>
  <RatingSelect on:rating-select={handleSelect} />
  <div class="input-group">
    <input type="text" on:input={handleInput} bind:value = {text} 
      placeholder={update ? "Please enter updated feedback" : "Tell us something that keeps you coming back"}>
    <Button disabled={btnDisabled} type="submit">Send</Button>
  </div>
  {#if message}
    <div class="message">
      {message}
    </div>
  {/if}
</form>
</Card>

<style>
  header {
    max-width: 400px;
    margin: auto;
  }

  header h2 {
    font-size: 22px;
    font-weight: 600;
    text-align: center;
  }

  .input-group {
    display: flex;
    flex-direction: row;
    border: 1px solid #ccc;
    padding: 8px 10px;
    border-radius: 8px;
    margin-top: 15px;
  }

  input {
    flex-grow: 2;
    border: none;
    font-size: 16px;
  }

  input:focus {
    outline: none;
  }

  .message{
    padding-top: 10px;
    text-align: center;
    color: rebeccapurple;
  }
</style>
