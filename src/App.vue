<template>
  <MyHeader @chosenItem="itemChange" />
  <component :is="currentItem" />
  <MyFooter />
</template>

<script>
import MyHeader from './components/layouts/header.vue'
import MyFooter from './components/layouts/footer.vue'

import LoginForm from './components/LoginForm.vue'
import AboutMe from './components/pages/AboutMe.vue'

export default {
  name: 'App',
  components: {
    MyHeader,
    MyFooter,
    LoginForm,
    AboutMe
  },
  data() {
    return {
      currentItem: "AboutMe",
    }
  },
  methods: {
    itemChange(newOne) {
      this.currentItem = newOne;
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  min-height: 100vh;
  position: relative;
}
</style>
