import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: "#app",
    components: { App }
  })
})
