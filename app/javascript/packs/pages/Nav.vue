<template>
  <ul class="right-lists-lp">
    <li><a href="/" class="nav-button">Top</a></li>
    <li><router-link class="nav-button" :to="{name:'ReportDetailsPage'}">Report</router-link></li>
    <li><router-link class="nav-button" :to="{name:'MemoDetailsPage'}">Memo</router-link></li>
    <li><router-link class="nav-button" :to="{name:'ArticleDetailsPage'}">Article</router-link></li>
  </ul>
</template>

<script>
export default {
  name: 'Header'
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.nav-button.router-link-exact-active {
  border-bottom: solid 2px black;
}


</style>
