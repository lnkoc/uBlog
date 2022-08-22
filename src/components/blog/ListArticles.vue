<template>
  <div class="listContainer">
    <div> 
      <h2>Lista artykułow</h2>
    </div>
      <template v-for="item in list" :key="item.ID">
        <div class="item">
          <h3> {{item.TITLE}}</h3>
          <p> {{item.INTRO}}</p>
          <button @click.prevent="$emit('edit', item.ID)" class="editButton">Edytuj</button> <button class="deleteButton">Usuń</button>
        </div>
        <br><br>
      </template>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: "ListArticles",
  emits: ["edit"],

  data() {
    return {
      list: []
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