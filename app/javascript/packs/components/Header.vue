<template>
  <header class="home-header">
    <ul class="header-left"><li class="header-logo">StudyReport</li></ul>
    <div class="header-right">
      <ul class="right-lists">
        <li><a href="#top" class="nav-button" @click="clickSmoothScroll('#top')">Top</a></li>
        <li><a href="#content" class="nav-button" @click="clickSmoothScroll('#content')">Content</a></li>
        <li><a href="#Why" class="nav-button" @click="clickSmoothScroll('#why')">Why</a></li>
        <li><a href="#details" class="nav-button" @click="clickSmoothScroll('#details')">Details</a></li>
        <li><a href="#start" class="nav-button" @click="clickSmoothScroll('#start')">Start</a></li>
      </ul>
      <div id="box">
        <span></span>
      </div>
    </div>

    <nav>
      <ul class='sp-right-lists'>
        <li><a href="#top" class="nav-button" @click="clickSmoothScroll('#top')">Top</a></li>
        <li><a href="#content" class="nav-button" @click="clickSmoothScroll('#content')">Content</a></li>
        <li><a href="#Why" class="nav-button" @click="clickSmoothScroll('#why')">Why</a></li>
        <li><a href="#details" class="nav-button" @click="clickSmoothScroll('#details')">Details</a></li>
        <li><a href="#start" class="nav-button" @click="clickSmoothScroll('#start')">Start</a></li>
      </ul>
    </nav>
  </header>
</template>

<script>
export default {
  name: 'Header',
  methods: {
    clickSmoothScroll (x) {
      event.preventDefault()
      this.$SmoothScroll(
        document.querySelector(x),
        1200,
        null,
        null,
        'y'
      )
    }
  }
}
</script>

<style scoped>

</style>