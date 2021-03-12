<template>
  <div class="home-header">
    <ul class="header-left"><li class="header-logo">StudyReport</li></ul>
    <div class="header-right">
      <Nav></Nav>
    </div>
  </div>
</template>

<script>
import Nav from './Nav.vue'
export default {
  name: 'Header',
  components: {
    Nav
  }
}
</script>

<style scoped>

</style>