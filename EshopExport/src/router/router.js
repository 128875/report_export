import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

var router =new Router({
  routes: [
    {
      path: '/login',
      name: 'login',
      component: () => import('@/pages/common/Login.vue')
    },
    {
      path: '/',
      redirect: '/login',
      name: 'Home',
      component: () => import("@/components/layout/Sidebar"),
      children: [
        {
          path: '/index',
          name: 'home',
          component: () => import("@/pages/home/Index")
        },
        {
          path: '/template',
          name: 'template',
          component: () => import("@/pages/show/Template")
        },
        {
          path: '/errorlog',
          name: 'errorlog',
          component: () => import("@/pages/show/Error")
        }
      ]
    },
  ]
})



export default router