module.exports = {
  lintOnSave: false,
  devServer:{
    port:8101,
    proxy:{
      '/api':{
        target:'http://192.168.9.26:8088/',
        //target:'http://192.168.0.83:8100/',
        ws : true,
        changeOrigin : true,
        pathRewrite: {
          '^/api': '/'
        }
      }
    }
  }
}
