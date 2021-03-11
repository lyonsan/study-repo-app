import Vue from 'vue'
import App from '../details.vue'
import VueRouter from 'vue-router'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('details'))
  const app = new Vue({
    el,
    render: h => h(App)
  })

  console.log(app)
})
Vue.use(VueRouter)
