<template>
  <div class="demoContainer">
    <template v-for="min in miniatures" :key="min.pathShort">
      <img :src="min.pathLong" class="miniature" @click="openDemo(miniatures.indexOf(min))">
    </template>
    <div v-if="demoActive" class="modal">
      <component :is="demoNumber" />
      <span class="close" @click="closeDemo">&times;</span>

    </div>
  </div>
</template>

<script>
import { defineAsyncComponent } from '@vue/runtime-core';

export default {
  name: 'WebGLGallery',
  components: {
    SevenDemo: defineAsyncComponent(() => import('@/components/WebGL/SevenDemo.vue')),
    SeventeenDemo: defineAsyncComponent(() => import('@/components/WebGL/SeventeenDemo.vue')),
    TenDemo: defineAsyncComponent(() => import('@/components/WebGL/TenDemo.vue')),
    TwentyDemo: defineAsyncComponent(() => import('@/components/WebGL/TwentyDemo.vue'))
  },
  data() {
    return {
      miniatures: [],
      demoActive: false,
      demoNumber: null
    }
  },
  created() {
    this.importAllMiniatures(require.context('../../assets/webgl_min/', true, /\.jpg$/));
  },

  methods: {
    importAllMiniatures(resource) {
      resource.keys().forEach(key => {
        this.miniatures.push({pathLong: resource(key), pathShort: key});
      });
    },
    openDemo(index) { 
      switch (index) {
        case 0:
          this.demoNumber = 'SevenDemo';
          console.log("zero czyli siedem");
          break;
        case 1:
          this.demoNumber = 'SeventeenDemo';
          console.log("jeden czyli siedemnaście");
          break;
        case 2:
          this.demoNumber = 'TenDemo';
          console.log("dwa czyli Dziesięć");
          break;
        case 3:
          this.demoNumber = "TwentyDemo";
          console.log("trzy czyli Dwadzieścia");
          break;
        default:
          console.log("domyślny hehe");
          break;
      }
      this.demoActive = true;
    },
    closeDemo() {
      this.demoActive = false;
      this.demoNumber = null;
    }
  }
}
</script>

<style>
.demoContainer {
  width: 660px;
}
.miniature {
  width: 155px;
  height: auto;
  border-radius: 10px;
  padding: 5px;
  
}
.miniature:hover {
  opacity: 0.8;
  cursor: pointer;
}
.modal {
  display: block;
  position: fixed;
  left: 0px;
  top: 0px;
  z-index: 2;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.9);
}
.close {
  position: fixed;
  top: 10px;
  right: 10px;
  font-size: 40px;
  font-weight: bold;
  color: whitesmoke;
  cursor: pointer;
}
</style>