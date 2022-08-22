<template>
  <div class="editContainer">
    <div>
        <h2>Edycja artykułu</h2>
    </div>
    <div class="formContainer">
        <form>
            <label for="title">Tytuł</label><br>
            <input v-model="title" class="generalSet" type="text" maxlength="255" id="titile"><br>
            <label for="intro">Wstęp</label><br>
            <textarea v-model="intro" class="generalSet" maxlength="300" id="intro" rows="4"></textarea><br>
            <label for="content">Treść</label><br>
            <textarea v-model="content" class="generalSet" maxlength="3000" id="content" rows="20"></textarea><br>

            <button @click.prevent="submit">Wyślij</button>
        </form>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
    name: "EditArticle",
    props: ['articleId'],
    data() {
        return {
            title: "",
            intro: "",
            content: ""
        }
    },
    created() {
        console.log(this.articleId);
        axios.post('/getArticle', {
            params: {
                id: this.articleId
                }
            }, {withCredentials: true})
            .then((res) => {

                this.title = res.data[0].TITLE;
                this.intro = res.data[0].INTRO;
                this.content = res.data[0].CONTENT;
            })
            .catch((err) => {
                console.log(err);
            })
    }


}
</script>

<style scoped>
.editContainer {
    padding: 35px;
    height: 80vh;
    position: relative;
}
.generalSet {
    width: 650px;
    padding: 10px;
    box-sizing: border-box;
}
 .formContainer label {
    font-size: 0.8em;
}    
.formContainer textarea {
    resize: none;
}
</style>