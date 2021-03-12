<template>
  <div id="details">
    <Header></Header>
    <router-view></router-view>
  </div>
</template>

<script>
import VueRouter from 'vue-router'
import Header from './packs/pages/DetailsHeader.vue'
import ReportDetailsPage from './packs/pages/ReportDetailsPage.vue'
import MemoDetailsPage from './packs/pages/MemoDetailsPage.vue'
import ArticleDetailsPage from './packs/pages/ArticleDetailsPage.vue'

const router = new VueRouter({
  routes: [
    {
      path: '/',
      name: 'ReportDetailsPage',
      component: ReportDetailsPage
    },
    {
      path: '/memo',
      name: 'MemoDetailsPage',
      component: MemoDetailsPage
    },
    {
      path: '/article',
      name: 'ArticleDetailsPage',
      component: ArticleDetailsPage
    }
  ]
})


export default {
  router,
  name: 'Details',
  components: {
    Header
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

</style>
