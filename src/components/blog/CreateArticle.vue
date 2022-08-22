<template>
    <div class="createContainer">
        <div>
            <h2>Utwórz artykuł</h2>
        </div>
        <div class="formContainer">
            <form>
                <label for="title">Tytuł</label><br>
                <input v-model="title" class="generalSet" type="text" maxlength="255" id="title"><br>
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
    name: "CreateArticle",
    emits: ["submit"],
    data() {
        return {
            title: "",
            intro: "",
            content: "",
        }
    },
    methods: {
        submit() {
            let data = {
                title: this.title,
                intro: this.intro,
                content: this.content,
              }
            axios.get('/sendArticle', data, {withCredentials:true})
                .then((res) => {
                    console.log(res.data);
                    this.$emit('submit');
                })
                .catch((err) => {
                    console.log(err);
                });
        }
    }
}
</script>

<style scoped>

.createContainer {
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