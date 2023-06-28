<template xmlns:vertical-align="http://www.w3.org/1999/xhtml" xmlns:required="">
  <div>
    <div class="page-title">Eshop欧洲账单导出</div>

    <el-card>
      <el-row style="margin-left: 0.5vw">
        <el-col :span="12">
          <el-card v-loading="file_loading">

            <el-upload class="upload-demo" drag ref="upload" :action="dataUrl + 'receiveFile'"
              :before-upload="handleBeforeUpload" :on-error="handleError" :on-success="handleSuccess"
              :before-remove="beforeRemove" :limit="1" :auto-upload="false">
              <i class="el-icon-upload"></i>
              <div class="el-upload__text">将文件拖到此处，或<em>点击搜索</em></div>
              <div slot="tip" class="el-upload__tip">只能上传.xlsx文件</div>
            </el-upload>
            <!-- <div v-show="progressFlag">
              <el-progress
                  :text-inside="true"
                  :stroke-width="14"
                  :percentage="progressPercent"
              ></el-progress>
            </div> -->

            <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传到服务器</el-button>
          </el-card>
        </el-col>
      </el-row>
    </el-card>
  </div>
</template>

<script>
import axios from "axios";
import service from "../../utils/request";

export default {
  name: "Lading",
  components: {},
  data() {
    return {
      isLock: false,  //防止用户频繁点击
      file_loading: false,
      dataUrl: "",
    }
  },
  mounted() {
    //触发权限判断
    service({
      url: '/HooyaInvoice/getExportAuth',
      method: 'get',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    }).then(res => {
      if (res.code == 200) {
        this.dataUrl = res.data
      }
    })
  },
  methods: {
    handleBeforeUpload() {
      this.file_loading = true;
    },

    beforeRemove(file) {
      return this.$confirm(`确定移除 ${file.name}？`);
    },

    handleError() {
      this.file_loading = false;
      this.$message({
        dangerouslyUseHTMLString: true,
        message: "文件解析失败！请检查文件格式或联系开发人员！",
        type: 'error',
        duration: 0,
        showClose: true
      });
    },

    handleSuccess(response) {

      this.file_loading = false;
      if (response.code == 200) {


        for (let key in response) {
          if (key != 'msg' & key != 'code') {
            axios({
              method: 'GET',
              url: 'http://192.168.9.75:9576/eu/report/' + 'getZipByte',
              params: {
                filePath: response[key]
              },
              responseType: 'blob'
            }).then(response => {
              // if (response.data.type === 'application/octet-stream') {
              if (response.data) {
                // 获取http头部的文件名信息，若无需重命名文件，将下面这行删去
                const fileName = decodeURI(response.headers['content-disposition'])
                /* 兼容ie内核，360浏览器的兼容模式 */
                if (window.navigator && window.navigator.msSaveOrOpenBlob) {
                  const blob = new Blob([response.data], { type: 'application/zip' })
                  window.navigator.msSaveOrOpenBlob(blob, fileName)
                } else {
                  /* 火狐谷歌的文件下载方式 */
                  const blob = new Blob([response.data], { type: 'application/zip' })
                  const url = window.URL.createObjectURL(blob)
                  const link = document.createElement('a') // 创建a标签
                  link.href = url
                  // 文件重命名，若无需重命名，将该行删去

                  link.download = fileName.split('\\')[fileName.split('\\').length - 1]
                  link.click()
                  URL.revokeObjectURL(url) // 释放内存
                }

              } else {
                console.log('error while reading zip file')
              }
            }).catch(error => this.$errorMsg(error))

          }
        }


        //通过请求下载zip文件

        this.$message({
          dangerouslyUseHTMLString: true,
          message: "文件已成功解析！账单已生成！",
          type: 'success',
          duration: 0,
          showClose: true
        });


      } else {
        this.$message({
          dangerouslyUseHTMLString: true,
          message: '格式错误！！账单信息： ' + response.Msg,
          type: 'error',
          duration: 0,
          showClose: true
        });
      }
    },
    submitUpload() {
      this.$refs.upload.submit();
    },


    // 删除输入框
    del() {
      this.formInline.splice(this.current_index, 1);
    },
  }
}
</script>

<style lang="less" scoped>
.page-title {
  font-weight: 700;
  margin-bottom: 10px;
  font-size: 18px;
}

.pagination {
  text-align: center;
  margin-top: 10px;
}

.census div {
  padding: 0 4px;
  border-radius: 4px;
}

.census div:hover {
  background: #FFF;
  cursor: auto;
}

.census.clickable div:hover {
  background: #DDD;
  cursor: pointer;
}

.census.clickable div.active {
  background: #409eff;
  color: #FFF;
}

.census div span {
  vertical-align: middle;
  line-height: 22px;
  font-size: 14px;
}

.census div span:nth-child(even) {
  font-weight: 700;
  float: right;
}

/deep/ .el-card__header {
  padding: 8px 12px;
  font-weight: 700;
  font-size: 14px;
}

/deep/ .el-card__body {
  padding: 15px;
}

/deep/ .census-box .el-card__body {
  padding: 8px 15px;
}

/deep/ .el-form-item__label {
  width: 100px;
}

/deep/ .search-param .el-form-item--small.el-form-item {
  margin: 0;
}

/deep/ .el-table thead tr th {
  background: #f5f7fa;
  font-size: 14px;
}
</style>
