<template>
  <div class="messages">
    <p v-for="message in messages" class="message">
      <template v-if="message.content">{{ message.content }}</template>
    </p>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: "ChatSpace",
  props: {
    roomId: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      messages: []
    }
  },
  mounted() {
    axios.get(`./${this.roomId}.json`)
    .then((responce)=>{
      this.messages = responce.data.messages
      console.log(responce)
    })
  }
}
</script>

<style lang="scss" scoped>
.messages {
  padding: 10px 30px;
  border: 3px solid black;
  border-radius: 20px;
}
.message {
  border: 1px dashed black;
  margin: 2em 0;
  padding: 0.5em;
  border-radius: 10px;
}
</style>
