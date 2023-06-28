<template>
    <div>
        <el-dialog :title="titleName" :visible.sync="dialogFormVisible" :close-on-click-modal="false" width="30%" top="25vh"
            custom-class="diag_class" :destroy-on-close="true" :before-close="closeForm">
            <el-form :model="form" class="uploadForm" ref="allformData" :rules="rules" :inline="true">
                <el-form-item label="模板文件" :label-width="formLabelWidth">
                    <el-upload ref="fileUpload" action="/api/InvoiceTemplate/uploadTemplateFile" accept=".docx"
                        :file-list="form.fileList" :auto-upload="false" :on-success="onSuccess"
                        :before-upload="beforeUpload" :on-change="handleChange">
                        <el-button slot="trigger" size="small" type="primary" plain>选取文件</el-button>
                        <el-button style="margin-left: 10px;" size="small" type="success" @click="templateFileUpload()"
                            plain>上传到服务器</el-button>
                        <span class="el-upload__tip">只能上传docx文件</span>
                    </el-upload>
                </el-form-item>

                <el-form-item label="模板名称" :label-width="formLabelWidth" prop="templateName">
                    <el-input v-model="form.templateName" autocomplete="off" maxlength="30" clearable
                        style="width: 300px;"></el-input>
                </el-form-item>
                <el-form-item label="店铺名称" :label-width="formLabelWidth" maxlength="30" prop="dianpu">
                    <el-input v-model="form.dianpu" autocomplete="off" clearable style="width: 300px;"></el-input>
                </el-form-item>

                <el-form-item label="货币单位" prop="unit" :label-width="formLabelWidth">
                    <el-select v-model="form.unit" placeholder="" filterable allow-create default-first-option
                        style="width: 150px;">
                        <el-option label="CZK" value="CZK"></el-option>
                        <el-option label="EUR" value="EUR"></el-option>
                        <el-option label="kr" value="kr"></el-option>
                        <el-option label="zł" value="zł"></el-option>
                        <el-option label="€" value="€"></el-option>
                    </el-select>
                </el-form-item>

                <el-form-item label="类型" prop="type" :label-width="formLabelWidth">
                    <el-select v-model="form.type" placeholder="" style="width: 150px;">
                        <el-option label="Invoice" :value="0"></el-option>
                        <el-option label="DeliveryNote" :value="1"></el-option>
                    </el-select>
                </el-form-item>

                <el-form-item label="国家" :label-width="formLabelWidth" prop="country">
                    <el-input v-model="form.country" autocomplete="off" clearable></el-input>
                </el-form-item>
            </el-form>
            <div slot="footer" class="upload-footer" append-to-body="true">
                <el-button @click="cancel()">取 消</el-button>
                <el-button type="primary" @click="handleUpload('allformData')">提 交</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script>

import { uploadTemplate, downloadDocx, getTemplateRootPath } from "@/api/http.js"
export default {
    name: 'templateUpload',

    data() {
        return {
            titleName: "模板上传信息",
            dialogFormVisible: false,
            form: {
                templateName: '',
                dianpu: '',
                country: '',
                path: '',
                pdfpath: '',
                fileList: [],
                type: '',
                unit: ''
            },
            formLabelWidth: '80px',

            rules: {
                templateName: [
                    { required: true, message: '请输入模板名称', trigger: 'blur' },
                    { min: 3, max: 30, message: '长度在 3 到 30 个字符', trigger: 'blur' }
                ],
                dianpu: [
                    { required: true, message: '请输入店铺名称', trigger: 'blur' },
                    { min: 3, max: 30, message: '长度在 3 到 30 个字符', trigger: 'blur' }
                ],
                country: [
                    { required: true, message: '请输入国家简称', trigger: 'blur' },
                    { min: 1, max: 15, message: '长度在 1 到 15 个字符', trigger: 'blur' }
                ],
                type: [
                    { required: true, message: '请选择类型', trigger: 'change' }
                ],
                unit: [
                    { required: true, message: '请选择单位', trigger: 'change' }
                ]
            }

        };
    },

    mounted() {

    },

    methods: {
        handledialogFormVisible(val, row) {
            if (row !== '') {
                this.form.templateName = row.templateName;
                this.form.dianpu = row.dianpu;
                this.form.country = row.country;
                this.form.type = row.type
                this.form.unit = row.unit
                this.form.id = row.id

                this.titleName = '模板编辑信息'
                let obj ={}
                this.$set(obj, 'name', row.templateName+'.docx');

                downloadDocx(row.id).then(res=>{
                    this.form.file = new Blob([res], { type: 'application/docx' })
                })
                getTemplateRootPath().then(res=>{
                    this.form.path = res.data[0];
                    this.form.pdfpath = res.data[1];
                })

                this.form.fileList.push(obj);
            } else {
                this.titleName = '模板上传信息'
            }
            this.dialogFormVisible = val
        },

        beforeUpload(file) {
            this.form.file = file
        },

        onSuccess(res, file, fileList) {
            if (res.code == 200) {
                this.form.path = res.data[0]
                this.form.pdfpath = res.data[1]
            } else {
                this.form.fileList = []
                this.$alert(res.msg, '错误', {
                    confirmButtonText: '确定',
                })
            }

        },

        templateFileUpload() {
            this.$refs.fileUpload.submit();
        },

        handleUpload(formName) {
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    console.log(valid)
                } else {
                    console.log('error submit!!');
                    return false;
                }
            });

            if (this.form.path === '' || this.form.pdfpath === '' || this.form.file === null) {
                this.$alert('请上传文件到服务器!', '错误', {
                    confirmButtonText: '确定',
                })
                return;
            }
            this.form.path = this.form.path + this.form.templateName + '.docx'
            this.form.pdfpath = this.form.pdfpath + this.form.templateName + '.pdf'
            //console.log(this.form.fileList)
            uploadTemplate(this.form).then(res => {
                if (res.code == 200) {

                    this.$parent.getTableData()

                    this.$message({
                        showClose: true,
                        message: '模板上传成功',
                        type: 'success',
                        //duration: 0
                    });

                    this.cancel()
                } else {

                    this.$alert(res.msg, '错误', {
                        confirmButtonText: '确定',
                    })
                }

            }).catch(err => {
                this.$message({
                    showClose: true,
                    message: '模板上传失败',
                    type: 'error'
                });
            })

        },

        handleChange(file, fileList) {
            if (fileList.length > 1) {
                this.form.fileList = [fileList[fileList.length - 1]]
                this.form.file = null
            }
        },

        cancel() {
            this.resetData()
            this.dialogFormVisible = false
        },

        closeForm(done) {
            this.resetData()
            done()
        },

        resetData() {
            this.form.templateName = '',
                this.form.dianpu = '',
                this.form.country = '',
                this.form.fileList = []
            this.form.path = ''
            this.form.ppdfath = ''
            this.form.unit = ''
            this.form.type = ''
        }

    },
};
</script>

<style lang="less" scoped>
.el-upload__tip {
    margin-left: 20px;
    font-weight: 100;
    font-size: 10px;
}

/deep/ .diag_class .el-dialog__body {
    padding: 10px 20px;
}
</style>