<template>
  <Suspense v-if="admin">
    <template #default>
      <LoginForm />
    </template>
    <template #fallback>
      <p>Ładowanie...</p>
    </template>
  </Suspense>
  <div v-else>
    <MyHeader @chosenItem="itemChange" />
    <component :is="currentItem" :key="componentKey" />
  </div>
  <MyFooter />
</template>

<script>
import {defineAsyncComponent} from 'vue'
// import {ref} from 'vue'
import MyHeader from './components/layouts/header.vue'
import MyFooter from './components/layouts/footer.vue'

import AboutMe from './components/pages/AboutMe.vue'
import uBlog from './components/pages/uBlog.vue'

export default {
  name: 'App',
  components: {
    MyHeader,
    MyFooter,
    AboutMe,
    uBlog,
    LoginForm : defineAsyncComponent(() => import('./components/LoginForm.vue')),
  },
  data() {
    return {
      currentItem: "AboutMe",
      admin: false,
      componentKey: 0
    }
  },
  methods: {
    itemChange(newOne) {
      if (newOne === "LoginForm") {
        this.admin = true;
      }
      else {
        this.componentKey++;
        this.currentItem = newOne;
      }
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
