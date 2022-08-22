<template>
  <div v-if="!edit" class="listContainer">
    <div >
      <div> 
        <h2>Lista artykułow</h2>
      </div>
      <div>
        <template v-for="item in list" :key="item.ID">
          <div class="item">
            <h3> {{item.TITLE}}</h3>
            <p> {{item.INTRO}}</p>
            <button @click.prevent="openArticle(item.ID)" class="editButton">Edytuj</button> <button class="deleteButton">Usuń</button>
          </div>
          <br><br>
        </template>
      </div>
    </div>
  </div>
  <EditArticle v-else :articleId="editId"/>
</template>

<script>
import { defineAsyncComponent } from '@vue/runtime-core'
import axios from 'axios'
export default {
  name: "ListArticles",
  components: {
    EditArticle: defineAsyncComponent( () => import("./EditArticle.vue"))
  },
  data() {
    return {
      list: [],
      edit: false,
      editId: ""
    }
  },
  mounted() {
    axios.get("/getList", {withCredentials: true})
          .then((res) => {
            console.log("pobieram listę artykułów");
            this.list = res.data;
          })
          .catch((err) => {
            console.log(err);
          })
  },
  methods: {
    openArticle(id) {
      this.edit = true;
      console.log(id);
      this.editId = id;
    }
  }
}
</script>

<style>
.listContainer {
  padding: 35px;
  max-height: 83vh;
  overflow-y: auto;
}
.item {
  padding: 20px;
  background-color: aliceblue;
}
.editButton {
  padding: 10px;
  border: 0px;
  color: aliceblue;
  background-color: cornflowerblue;
}
.deleteButton {
  padding: 10px;
  border: 0px;
  color: aliceblue;
  background-color: darkred;
}
</style>