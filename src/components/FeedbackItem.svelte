<script>
  import {FeedbackStore} from '../stores'
  import Card from './Card.svelte'
  import Icon from '@iconify/svelte';
  import EditOverlay from './EditOverlay.svelte';

  export let item

  let editOverlay = false;
  const handleDelete = (itemId) => {
    FeedbackStore.update((currentFeedback) => {
      return currentFeedback.filter(item => item.id != itemId)
    })
  }
  const toggleOverlay = () =>{
    if (editOverlay) {
      editOverlay = false
    }
    else 
      editOverlay = true;
  }
</script>

<Card>
  <div class="num-display">
    <span class="rating-text">{item.rating}</span>
  </div>
  <button class="close" on:click={() => handleDelete(item.id)}><Icon width= 20px  icon="ant-design:delete-outlined" />
  </button>
  <p class="text-display">
    {item.text}
  </p>
  <button class="edit" on:click={toggleOverlay}><Icon width= 20px  icon="akar-icons:edit" />
  
</Card>
{#if editOverlay === true}
    <EditOverlay {toggleOverlay} itemId = {item.id} />
  {/if}
<style>
  .num-display {
    position: absolute;
    top: -10px;
    left: -10px;
    width: 50px;
    height: 50px;
    background: #FFCC00;
    color: #fff;
    border: 1px #eee solid;
    border-radius: 50%;
    padding: 10px;
    text-align: center;
    font-size: 19px;
  }
  .close {
    position: absolute;
    top: 10px;
    right: 20px;
    cursor: pointer;
    background: none;
    border: none;
  }
  .close:hover{
    color: red;
  }
  .edit {
    position: absolute;
    bottom: 10px;
    right: 20px;
    cursor: pointer;
    background: none;
    border: none;
  }
  .edit:hover{
    color:rebeccapurple;
  }
  .rating-text{
    color: black;
  }
</style>