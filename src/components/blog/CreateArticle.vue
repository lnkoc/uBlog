<template>
    <div class="createContainer">
        <div>
            Utwórz artykuł
        </div>
        <div class="formContainer">
            <form>
                <label for="title">Tytuł</label><br>
                <input :value="title" class="generalSet" type="text" maxlength="255" id="title"><br>
                <label for="content">Treść</label><br>
                <textarea :value="content" class="generalSet" maxlength="3000" id="content" rows="30"></textarea><br>
                
                <button @click.prevent="submit">Wyślij</button>
            </form>
        </div>
    </div>
</template>

<script>
export default {
    name: "CreateArticle",
    data() {
        return {
            title: "",
            content: "",
            date: "",
            time: ""
        }
    },
    methods: {
        submit() {
            console.log("submit!");
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