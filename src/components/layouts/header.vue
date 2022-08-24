<template>
  <div class="background">
    <div class="wrapper">
        <div class="logo">
            <div class="column">
            <img alt="Mylogo" src="../../assets/ln.png" @click="login">
            </div>
            <div class="column">
            <img alt="MyType" src="../../assets/koc.png">
            </div>
        </div>
        <div class="menu">
            <button @click="aboutMe">o mnie</button>
            <button @click="uBlog">μBlog</button>
            <button @click="myHobby">hobby</button>
            <button>github</button>
            <button>kontakt</button>
        </div>    
    </div>
  </div>
</template>

<script>
export default {
    name: 'MyHeader',
    methods: {
        login() {
            console.log("otwieram logowanie");
            this.$emit("chosenItem", "LoginForm");
        },
        aboutMe() {
            console.log("strona o mnie");
            this.$emit("chosenItem", "AboutMe");
        },
        uBlog() {
            console.log("uBlog");
            this.$emit("chosenItem", "uBlog");
        },
        myHobby () {
            console.log("moje hobby");
            this.$emit("chosenItem", "MyHobby");
        }
    }

}
</script>

<style scoped>

.background {
    top: 0px;
    position: sticky;
    width: 100%;
    background-color: cornflowerblue;    
}
.wrapper {
    width: 720px;
    height: 60px;
    margin: auto;
    overflow: hidden;
    background-color: rgb(69, 127, 236);
}
.logo {
    float:left;
    width: 180px;
}
.column {
    float: left;
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