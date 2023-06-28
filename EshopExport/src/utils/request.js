import axios from 'axios'
import Vue from 'vue'
import router from '../router/router'
axios.defaults.baseURL = '/api'

// create an axios instance
const service = axios.create({
    // withCredentials: true, // send cookies when cross-domain requests
    timeout: 500000000 // request timeout
})

// request拦截器 request interceptor
service.interceptors.request.use(
    config => {
        config.headers["satoken"] = sessionStorage.getItem('spba-token')
        config.headers["Content-Type"] = "application/json"
        return config
    },
    error => {
        console.log(error) // for debug
        return Promise.reject(error)
    }
)

// respone拦截器
service.interceptors.response.use(
    response => {
        if (response.status === 200) {
            // 拦截登录失效、无权限操作
            if (response.data.code == 501) {
                sessionStorage.removeItem('spba-token');
                sessionStorage.removeItem('spba-username');
                sessionStorage.removeItem('spba-perms');
                Vue.prototype.$alert(response.data.msg, {
                    confirmButtonText: '确定',
                    showClose: false,
                    callback() {
                        router.push('/login');
                    }
                });
            }
            return response.data;
        } else {
            Promise.reject();
        }
    },
    error => {
        console.log('err' + error)
        return Promise.reject(error)
    }
)

export default service