<template>
  <div id="app">
    <Header></Header>
    <Top></Top>
    <Content></Content>
    <Why></Why>
    <Details></Details>
    <Start></Start>
  </div>
</template>

<script>
import Header from './packs/components/Header.vue'
import Top from './packs/components/Top.vue'
import Content from './packs/components/Content.vue'
import Why from './packs/components/Why.vue'
import Details from './packs/components/Details.vue'
import Start from './packs/components/Start.vue'
export default {
  name: 'App',
  components: {
    Header,
    Top,
    Content,
    Why,
    Details,
    Start
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

</style>
