<template>
  <div class="backstage">
    <div class="menuWrapper">
        <div class="desc">Panel administratora</div>
        <div class="menu">
            <button @click="create">Utwórz artykuł</button>
            <button @click="list">Edycja artykułów</button>
            <button @click="logout">Wyloguj</button>
        </div>
    </div>
    <!-- <div class="content"> -->
        <component :is="currentItem" @submited="list" :key="componentKey" />
    <!-- </div> -->
  </div>
</template>

<script>
import { defineAsyncComponent } from '@vue/runtime-core'
import CreateArticle from './CreateArticle.vue'

export default {
    name: "MainForm",
    components: {
        CreateArticle,
        ListArticles: defineAsyncComponent(() => import("./ListArticles.vue")),
    },
    data() {
        return {
            currentItem: "CreateArticle",
            articleId: "",
            componentKey: 0
        }
    },
    methods: {
        create() {
            this.currentItem = "CreateArticle";
        },
        list() {
            this.componentKey++;
            this.currentItem = "ListArticles";
            console.log("ładuję listę artykułów");
        },
        logout(){
            //TODO skasować ciasteczka
            location.reload();
        }
    }
}
</script>

<style scoped>
.backstage {
    margin: auto;
    width: 720px;
    min-height: 100vh;
    background-color: rgba(255, 255, 255, 0.7);
}
.menuWrapper {
    height: 60px;
    width: 720px;
    background-color: rgb(69, 127, 236);
    position: sticky;
    top: 0px;
}
.desc {
    width: 200px;
    float: left;
    padding: 19px;
    color: aliceblue;
    font-size: 19px;
    font-weight: bold;
}
.menu {
    text-align: right;
    overflow: hidden;
}
.menu button {
    height: 60px;
    padding: 12px;
    background-color: rgb(69, 127, 236);
    color: aliceblue;
    border: 0px;
    border-left: 1px solid cornflowerblue;
    transition-duration: 0.4s;
}
.menu button:hover {
    background-color: aliceblue;
    color: rgb(69, 127, 236);
}
</style>