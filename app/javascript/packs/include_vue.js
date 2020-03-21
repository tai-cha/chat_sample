import Vue from 'vue/dist/vue.esm'
import ChatSpace from '../components/ChatSpace'
import ActionCable from 'actioncable'
import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

Vue.prototype.$cable = ActionCable.createConsumer('wss:taichan-chat-sample.herokuapp.com/cable');

document.addEventListener('turbolinks:load', () => {
  new Vue({
    el: "#app",
    components: {
      ChatSpace
    }
  })
})
