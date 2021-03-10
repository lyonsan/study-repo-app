<template>
  <ul class="right-lists">
    <li><a href="#top" class="nav-button" @click="clickSmoothScroll('#top')">Top</a></li>
    <li><a href="#content" class="nav-button" @click="clickSmoothScroll('#content')">Content</a></li>
    <li><a href="#Why" class="nav-button" @click="clickSmoothScroll('#why')">Why</a></li>
    <li><a href="#details" class="nav-button" @click="clickSmoothScroll('#details')">Details</a></li>
    <li><a href="#start" class="nav-button" @click="clickSmoothScroll('#start')">Start</a></li>
  </ul>
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

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
