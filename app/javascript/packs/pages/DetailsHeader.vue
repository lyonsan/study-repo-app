<template>
  <header class="home-header">
    <ul class="header-left"><li class="header-logo">StudyReport</li></ul>
    <div class="header-right">
      <ul class="right-lists">
        <li><a href="/" class="nav-button">Top</a></li>
        <li><router-link class="nav-button" :to="{name:'ReportDetailsPage'}">Report</router-link></li>
        <li><router-link class="nav-button" :to="{name:'MemoDetailsPage'}">Memo</router-link></li>
        <li><router-link class="nav-button" :to="{name:'ArticleDetailsPage'}">Article</router-link></li>
      </ul>
      <div id="box">
        <span></span>
      </div>
    </div>
    <nav>
      <ul class='sp-right-lists'>
        <li><a href="/" class="nav-button">Top</a></li>
        <li><router-link class="nav-button" :to="{name:'ReportDetailsPage'}">Report</router-link></li>
        <li><router-link class="nav-button" :to="{name:'MemoDetailsPage'}">Memo</router-link></li>
        <li><router-link class="nav-button" :to="{name:'ArticleDetailsPage'}">Article</router-link></li>
      </ul>
    </nav>
  </header>
</template>

<script>
export default {
  name: 'Header'
}
</script>

<style scoped>
.nav-button.router-link-exact-active {
  border-bottom: solid 2px black;
}
</style>>