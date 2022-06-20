<script>
    import FeedbackForm from "./FeedbackForm.svelte";

    export let toggleOverlay;
    export let itemId;

</script>
<main>
    
  <div class="overlay">
    <button class="close" on:click={toggleOverlay} > <b>X</b> </button>
      <div class="feedbackForm">
          <FeedbackForm updateItemId = {itemId} update = {true} {toggleOverlay}/>
      </div>
    </div>
</main>
<style>
    .overlay{
        z-index: 100;
        position:fixed;
        top:0;
        left:0;
        right:0;
        bottom:0;
        height: 100%;
        width: 100%;
        background-color:rgba(0, 0, 0, 0.85);
        display: flex;
        justify-content: center;
        align-items: center;
        
    }
    .feedbackForm{
        align-self: center;
    }
    .close {
    position: absolute;
    top: 10px;
    right: 20px;
    color:white;
    cursor: pointer;
    background: none;
    border: none;
  }

</style>