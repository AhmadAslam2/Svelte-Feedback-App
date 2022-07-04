<script>
  import {courses, courseId} from '../stores'
  import Rating from './Rating.svelte'
  import { toast } from '@zerodevx/svelte-toast'

  let text = ''
  let rating = 10

  let currentCourseId;
  courseId.subscribe(value => {currentCourseId = value})
  const handleSelect = e => {rating = e.detail}

  const handleSubmit = () => {
      const newFeedback = {
        id: $courses[currentCourseId].feedbacks.length,
        text,
        rating: rating
      }
      courses.update((courseArray)=>{
        courseArray[currentCourseId].feedbacks = [newFeedback,...$courses[currentCourseId].feedbacks]
        return courseArray;
      })
      text = ''
      toast.push('Thank you for the feedback!', {
        theme: {
          '--toastBackground': '#48BB78',
          '--toastBarBackground': '#2F855A'
        }
      })
  }
</script>

<div class="card">

  <h2 class="heading">How would you rate this course?</h2>
  <form on:submit|preventDefault={handleSubmit}>
    <Rating on:rating-select={handleSelect} />
    <div class="input-group">
      <input type="text" bind:value = {text} 
        placeholder="Any suggestions">
      <button class="input-button" type="submit">Send</button>
    </div>
  </form>
</div>

