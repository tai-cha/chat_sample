import Vue from 'vue/dist/vue.esm'
import ChatSpace from '../components/ChatSpace'

import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  new Vue({
    el: "#app",
    components: {
      ChatSpace
    }
  })
})
