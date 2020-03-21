<template>
  <div class="chatspace">
    <div class="messages">
      <p v-if="messages.length < 1">No Message Here.</p>
      <p v-for="message in messages" class="message">
        {{ message.content }}
      </p>
    </div>

    <div class="speak">
      <span><label for="name">名前</label><input id="name" v-model="name" placeholder="名無しさん"></span>
      <input v-model="formText" type="text" @keypress.enter="sendMessage">
      <button @click.prevent="sendMessage">送信する</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token
axios.defaults.headers.common['Accept'] = 'application/json'

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
      messages: [],
      name: '',
      formText: ''
    }
  },
  computed: {
    sendText() {
      return `${this.name || '名無しさん'}: ${this.formText}`
    }
  },
  created() {
    axios.get(`./${this.roomId}.json`)
    .then((responce)=>{
      this.messages = responce.data.messages
    })
  },
  mounted() {
    const _this = this
    const channel = this.$cable.subscriptions.create({ channel: "ChatRoomChannel", room_id: this.roomId }, {
      received(data) {
        window.console.debug(data)
        _this.messages.push(JSON.parse(data.body))
      }
    })
  },
  methods: {
    sendMessage() {
      const data = {
        postable_type: 'text',
        content: this.sendText
      }
      axios.post(`./${this.roomId}/posts.json`, data)
      .then((responce)=>{
        this.formText = ''
      })
    }
  }
}
</script>

<style scoped>
.messages {
  padding: 10px 30px;
  border: 3px solid black;
  border-radius: 20px;
  height: min(80vh, 700px);
  overflow-y: scroll;
}
.message {
  border: 1px dashed black;
  margin: 2em 0;
  padding: 0.5em;
  border-radius: 10px;
}
</style>
