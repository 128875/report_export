<template>
  <div class="layout">
    <!-- <div class="layout-header">123</div> -->
    <div class="layout-menu">
      <el-menu :default-active="$route.path" background-color="#001529" text-color="#fff" active-text-color="#1890ff"
        router :collapse="true">
        <el-menu-item :index="item.path" v-for="(item, index) in perms" :key="index">
          <i :class="item.icon"></i>
          <span slot="title">{{ item.name }}</span>
        </el-menu-item>
        <!-- <el-menu-item index="/index" @click="$router.push('/index')">
          <i class="el-icon-document"></i>
          <span slot="title">上传批量文件</span>
        </el-menu-item>
      -->
      </el-menu>
    </div>
    <div class="layout-content">
      <router-view />
    </div>
  </div>
</template>


<script>
export default {
  name: "Layout",
  data() {
    return {
      newDate: new Date(),
      perms: [],
    }
  },
  created() {
    this.perms = JSON.parse(sessionStorage.getItem('spba-permissions'));
  },

  mounted() {
    //this.activeIndex = this.$route.path
    /* this.$nextTick(() => {
      const path = window.location.href.match(/\/[A-Za-z]*$/)[0];
      this.defaultActive = path === "/" ? "1" : "2";
    }) */
  },
  methods: {
    // 时间格式化
    dateFormat() {
      var date = new Date()
      var year = date.getFullYear()
      // 在日期格式中，月份是从0开始的
      // 使用三元表达式在小于10的前面加0，以达到格式统一  如 09:11:05
      var month = date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1
      var day = date.getDate() < 10 ? '0' + date.getDate() : date.getDate()
      var hours = date.getHours() < 10 ? '0' + date.getHours() : date.getHours()
      var minutes = date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()
      var seconds = date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds()
      let week = date.getDay() // 星期
      let weekArr = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六']
      // 拼接 时间格式处理
      return year + '年' + month + '月' + day + '日 ' + hours + ':' + minutes + ':' + seconds + ' ' + weekArr[week]
    },

    // 全屏事件
    handleFullScreen() {
      let element = document.documentElement
      if (this.fullscreen) {
        if (document.exitFullscreen) {
          document.exitFullscreen()
        } else if (document.webkitCancelFullScreen) {
          document.webkitCancelFullScreen()
        } else if (document.mozCancelFullScreen) {
          document.mozCancelFullScreen()
        } else if (document.msExitFullscreen) {
          document.msExitFullscreen()
        }
      } else {
        if (element.requestFullscreen) {
          element.requestFullscreen()
        } else if (element.webkitRequestFullScreen) {
          element.webkitRequestFullScreen()
        } else if (element.mozRequestFullScreen) {
          element.mozRequestFullScreen()
        } else if (element.msRequestFullscreen) {
          // IE11
          element.msRequestFullscreen()
        }
      }
      this.fullscreen = !this.fullscreen
    },

  },

}
</script>

<style lang="less" scoped>
.layout {
  // &-header {
  //   //position: fixed;
  //   background-color: #319795;
  //   height: 8vh;
  // }

  //display: flex;
  &-menu {
    position: fixed;
    background-color: #001529;
    height: 100vh;

    .fold-icon {
      position: absolute;
      bottom: 0;
      left: 0;
      color: #909399;
      padding: 23px;
      font-size: 18px;
      cursor: pointer;
    }
  }

  &-content {
    //position: fixed;
    width: calc(100vw - 64px);
    background-color: #f9f9f9;
    padding: 15px;
    margin-left: 64px;
    box-sizing: border-box;
  }
}

/deep/ .el-menu {
  border: none;
}
</style>