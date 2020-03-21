import Vue from 'vue/dist/vue.esm'
import ChatSpace from '../components/ChatSpace'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: "#app",
    components: {
      ChatSpace
    }
  })
})
