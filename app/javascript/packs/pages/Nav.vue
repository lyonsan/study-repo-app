<template>
  <ul class="right-lists">
    <li><a href="/home" class="nav-button">Top</a></li>
    <li><router-link :to="{name:'ReportDetailsPage'}">学習報告</router-link></li>
    <li><router-link :to="{name:'MemoDetailsPage'}">メモ</router-link></li>
    <li><router-link :to="{name:'ArticleDetailsPage'}">記事</router-link></li>
  </ul>
</template>

<script>
export default {
  name: 'Header'
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
