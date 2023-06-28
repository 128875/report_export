// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router/router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';



Vue.config.productionTip = false
Vue.use(ElementUI, {size: "small"});
Vue.use(VueSweetalert2);

/* eslint-disable no-new */
new Vue({
  router,
  render: h => h(App)
}).$mount("#app")

