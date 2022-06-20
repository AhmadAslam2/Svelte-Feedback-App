<script>

  import {filterValue} from '../stores.js'

  function filterHandle (value){
    filterValue.set(value)
  } 

  let selected = 0
</script>
<main class="card">
    <button on:click={() =>{filterHandle(0), selected = 0}} class={selected === 0 && "selected"}>all</button>
    <button on:click={() =>{filterHandle(1), selected = 1}} class={selected === 1 && "selected"}>1</button>
    <button on:click={() =>{filterHandle(2), selected = 2}} class={selected === 2 && "selected"}>2</button>
    <button on:click={() =>{filterHandle(3), selected = 3}} class={selected === 3 && "selected"}>3</button>
    <button on:click={() =>{filterHandle(4), selected = 4}} class={selected === 4 && "selected"}>4</button>
    <button on:click={() =>{filterHandle(5), selected = 5}} class={selected === 5 && "selected"}>5</button>
    <button on:click={() =>{filterHandle(6), selected = 6}} class={selected === 6 && "selected"}>6</button>
    <button on:click={() =>{filterHandle(7), selected = 7}} class={selected === 7 && "selected"}>7</button>
    <button on:click={() =>{filterHandle(8), selected = 8}} class={selected === 8 && "selected"}>8</button>
    <button on:click={() =>{filterHandle(9), selected = 9}} class={selected === 9 && "selected"}>9</button>
    <button on:click={() =>{filterHandle(10), selected = 10}} class={selected === 10 && "selected"}>10</button>
    
</main>
<style>
.card {
    display: flex;
    justify-content: space-evenly;
    background-color: #fff;
    color: #333;
    border-radius: 5px;
    border: 1px solid #cccccc;
    padding: 30px;
    margin: 30px 0px 20px 0px;
    position: relative;
    box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
  }
  button {
    background-color: #FFCC00;
    border: 0;
    border-radius: 8px;
    width: 50px;
    height: 40px;
    cursor: pointer;
  }
  button:hover {
    transform: scale(0.98);
    opacity: 0.9;
    background-color:rebeccapurple;
    color: white;
  }
  .selected{
    color: white;
    background-color:rebeccapurple;
  }
</style>