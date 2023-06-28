<template>
    <div>

        <body>
            <div class="login">
                <div class="box">
                    <p class="table">Login</p>
                    <br>
                    <input class="username" type="text" v-model="params.username" placeholder="账号" @keyup.enter="submit()">
                    <input class="password" type="password" v-model="params.password" placeholder="密码" @keyup.enter="submit()">
                    <br>
                    <a href="javaScript:void(0);"  @click="submit()" class="go">GO</a>
                    <!-- <input href="javaScript:void(0);" @click="submit()" class="go" value="GO"/> -->
                </div>
            </div>
        </body>
    </div>
</template>

<script>
import { login } from '@/api/common.js'
export default {
    name: 'EshopExportLogin',

    data() {
        return {
            params: {
                username: "",
                password: ""
            },
        };
    },

    created() {
    },

    methods: {
        submit() {
            login(this.params).then(res => {
                if (res.code == 200) {
                    this.$swal({
                        title: 'Success!',
                        text: res.msg,
                        icon: 'success',
                        confirmButtonText: '确定',
                    }).then((result) => {
                        if (result.isConfirmed) {
                            sessionStorage.setItem("spba-username", res.data.username);
                            sessionStorage.setItem("spba-permissions", JSON.stringify(res.data.permissions))
                            sessionStorage.setItem("spba-token", res.data.token)
                            this.$router.push("/index")
                        }
                    });

                } else {
                    this.$swal({
                        title: 'Error!',
                        text: res.msg,
                        icon: 'error',
                        confirmButtonText: '重试'
                    }).then((result) => {
                        // console.log(res)
                        /* if (result.isConfirmed) {
                            this.$router.push("/login")
                        } */
                    });

                }

            }).catch(err => {
                console.log(err);
            })

        }
    },
};
</script>

<style lang="less" scoped>
* {
    padding: 0;
    margin: 0;
    text-decoration: none;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    //background-image: url('./background.png');
    background: #80afdd;
    background-size: cover;
}

.login {
    width: 550px;
    height: 400px;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(to right bottom,
            rgba(255, 255, 255, .7),
            rgba(255, 255, 255, .5),
            rgba(255, 255, 255, .4));
    /* 使背景模糊化 */
    backdrop-filter: blur(10px);
    box-shadow: 0 0 20px #a29bfe;
    border-radius: 15px;
}

.box {
    overflow: hidden;
    display: flex;
    flex-direction: column;

    .table {
        font: 900 40px 'serif';
        text-align: center;
        letter-spacing: 5px;
        color: #3d3d3d;
    }

    form {
        overflow: hidden;
        width: 420px;
        height: 100%;
    }

    .username,
    .password {
        width: 400px;
        height: 100%;
        margin-bottom: 20px;
        outline: none;
        border: 0;
        padding: 10px;
        background-color: transparent;
        border-bottom: 3px solid rgb(150, 150, 240);
        font: 900 16px 'serif';
    }

    .go {
        text-align: center;
        display: block;
        height: 24px;
        padding: 12px;
        font: 900 20px 'serif';
        //border: 0;
        border-radius: 10px;
        margin-top: 20px;
        color: #fff;
        letter-spacing: 3px;
        background-image: linear-gradient(to left,
                #fd79a8, #a29bf6);
    }
}
</style>