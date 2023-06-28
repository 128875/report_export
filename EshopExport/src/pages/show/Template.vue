<template>
    <div>
        <div class="page-title">
            账单模板信息
            <span>
                <el-button type="primary" size="medium" @click="openUploadDialog()">模板上传<i
                        class="el-icon-upload el-icon--right"></i></el-button>
            </span>
        </div>

        <el-card style="width: 90%;">
            <el-table :data="tableDataFilter" style="width: 100%;" :row-class-name="rowClassName" :default-sort="{ prop: 'xh' }">
                <el-table-column label="序号" prop="xh" width="80px" sortable>
                </el-table-column>
                <el-table-column label="模板名称" prop="templateName">
                </el-table-column>
                <el-table-column label="国家" prop="country" width="120px">
                </el-table-column>
                <el-table-column label="店铺" prop="dianpu">
                </el-table-column>
                <el-table-column align="right">
                    <template slot="header" slot-scope="scope">
                        <el-input v-model="search" size="mini" placeholder="输入关键字搜索" />
                    </template>
                    <template slot-scope="scope">
                        <el-button size="mini" type="info" plain
                            @click="handleDisplay(scope.$index, scope.row)">模板预览</el-button>
                        <el-button size="mini" type="primary" plain
                            @click="handleDownload(scope.$index, scope.row)">模板下载</el-button>
                        <el-button size="mini" type="success" plain
                            @click="handleEdit(scope.$index, scope.row)">修改</el-button>
                        <el-button size="mini" type="danger" plain
                            @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                    </template>
                </el-table-column>
            </el-table>
        </el-card>

        <templateUpload ref="templateUploadDialog"></templateUpload>
    </div>
</template>

<script>
import request from "@/utils/request"
import { previewPdf, downloadDocx, deleteTemplate } from "@/api/http.js"
import templateUpload from '@/components/layout/Template-upload'

export default {
    name: 'TemplateMsg',

    components: {
        templateUpload,
    },

    data() {
        return {
            tableData: [],
            search: '',
        };
    },

    created() {
        this.getTableData()
    },

    computed: {
        tableDataFilter() {
            return this.tableData.filter(data => !this.search ||
                    data.templateName.toLowerCase().includes(search.toLowerCase()) ||
                    data.country.toLowerCase().includes(search.toLowerCase()) ||
                    data.dianpu.toLowerCase().includes(search.toLowerCase()))
        }
    },


    mounted() {
    },

    methods: {
        getTableData() {
            request.get("/InvoiceTemplate/list").then(res => {
                this.tableData = res
            }).catch(err => {
                console.log(err)
            })
        },
        handleDisplay(index, row) {
            previewPdf(row.id).then(res => {
                let url = window.URL.createObjectURL(
                    new Blob([res], { type: 'application/pdf' })
                );
                let iheight = 720, iwidth = 1024;
                window.open(url, '_blank', 'height=' + iheight + ',width=' + iwidth + ',top=' + (window.screen.height - 30 - iheight) / 2 + ',left=' + (window.screen.width - 10 - iwidth) / 2);
                URL.revokeObjectURL(url)
            }).catch(err => {
                console.log(err);
            });

        },
        handleDownload(index, row) {
            downloadDocx(row.id).then(res => {
                const blob = new Blob([res], { type: 'application/docx' })
                const a = document.createElement('a')
                a.download = row.templateName + '.docx'
                a.href = window.URL.createObjectURL(blob)
                a.click()
                a.remove()
            }).catch(err => {
                console.log(err);
            });
        },
        rowClassName({ row, rowIndex }) {
            row.xh = rowIndex + 1;
        },
        handleDelete(index, row) {

            this.$confirm('该操作将永久删除该模板文件, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {

                deleteTemplate(row.id).then(res => {
                    if (res.code == 200) {
                        this.$message({
                            type: 'success',
                            message: res.msg
                        });
                        this.getTableData()
                    } else {
                        this.$message({
                            type: 'error',
                            message: res.msg
                        });
                    }

                }).catch(err => {
                    this.$message({
                        type: 'error',
                        message: err
                    });
                })

            }).catch(() => {
                this.$message({
                    type: 'info',
                    message: '已取消删除'
                });
            });

        },

        handleEdit(index, row) {
            this.$refs.templateUploadDialog.handledialogFormVisible(true, row)
        },

        openUploadDialog() {
            this.$refs.templateUploadDialog.handledialogFormVisible(true, '');
        }
    },
};
</script>

<style lang="less" scoped>
.page-title {
    font-weight: 700;
    margin-bottom: 20px;
    font-size: 18px;

    span {
        float: right;
        padding-right: 11.5%;
    }
}
</style>