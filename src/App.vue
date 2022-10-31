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
    <Transition>
      <component :is="currentItem" :key="componentKey" />
    </Transition>
  </div>
  <MyFooter />
</template>

<script>
import {defineAsyncComponent} from 'vue'
import MyHeader from './components/layouts/header.vue'
import MyFooter from './components/layouts/footer.vue'

import AboutMe from './components/pages/AboutMe.vue'
import uBlog from './components/pages/uBlog.vue'
import MyHobby from './components/pages/MyHobby.vue'
import MyProjects from './components/pages/MyProjects.vue'

export default {
  name: 'App',
  components: {
    MyHeader,
    MyFooter,
    AboutMe,
    uBlog,
    MyHobby,
    MyProjects,
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
.v-enter-active {
  transition: opacity 0.5s ease;
}
.v-enter-from {
  opacity: 0;
}

</style>
