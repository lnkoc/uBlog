<template>
    <div class="wrapper">
        <form class="loginForm">
            <fieldset>
                <legend> Logowanie </legend>
                <label for="nickname"> Użytkownik </label><br>
                <input type="text" v-model="nickName" id="nickname" maxlength="25" autofocus> 
                <br><br>
                <label for="pass"> Hasło </label><br>
                <input type="password" v-model="pass" id="pass" maxlength="25">
                <br><br>
                <button class="myButton" @click.prevent="logIn">Zaloguj</button>
            </fieldset>
        </form>
    </div>
</template>

<script>
export default {
    name: 'LoginForm',
    data() {
        return {
            nickName: "",
            pass: "",
        }
    },
    methods: {
        logIn() {
            console.log("loguj");
            
        }
    }

}
</script>

<style scoped>

.wrapper {
    width: 720px;
    margin: auto;
    min-height: 300px;
    position: relative;
    background-color: rgba(255, 255, 255, 0.7);
}
.loginForm {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 300px;
    color: rgb(69, 127, 236);
}
.loginForm legend {
    padding: 1em;
}
.loginForm fieldset {
    border: 1px solid aliceblue;
}
.loginForm label {
    font-size: 0.8em;
}

.loginForm input {
    padding: 10px;
}
.myButton {
    width: 200px;
    padding: 10px;
    border: 0px;
    color: aliceblue;
    background-color: cornflowerblue;
}

</style>