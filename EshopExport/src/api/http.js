import request from '@/utils/request.js'

var previewPdf =  function(templateId) {

    return request(
        {
            url: '/InvoiceTemplate/templatePdf',
            method: 'post',
            Headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            params: {
                templateId,
            },
            responseType: 'blob'
        }
    )
}

var downloadDocx = function(templateId){
    return request(
        {
            url: '/InvoiceTemplate/downloadTemplate',
            method: 'post',
            Headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            params: {
                templateId,
            },
            responseType: 'blob'
        }
    )
}

var getTemplateRootPath =function(){
    return request(
        {
            url: '/InvoiceTemplate/getTemplateRootPath',
            method: 'get',
            Headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        }
    )
}


var uploadTemplate = function(templateform){
    return request(
        {
            url: '/InvoiceTemplate/uploadTemplate',
            method: 'post',
            headers: { 'Content-Type': 'multipart/form-data;boundary='+new Date().getTime() },
            data:paramsToFormData(templateform),
        }
    )

}

var deleteTemplate = function(templateId){
    
    return request(
        {
            url: '/InvoiceTemplate/deleteTemplate',
            method: 'delete',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            params:{
                templateId
            },
        }
    )

}

var getErrorLog = function(params){
    return request(
        {
            url: '/log/error',
            method: 'get',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            params,
        }
    )
}

var getTemplate = function(templateId){
    
    return request(
        {
            url: '/InvoiceTemplate/getTemplate',
            method: 'get',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            params:{
                templateId
            },
        }
    )

}


//js 对象转 form-data对象
function paramsToFormData(obj) {
    const formData = new FormData();
    Object.keys(obj).forEach((key) => {
        if (obj[key] instanceof Array) {
          obj[key].forEach((item) => {
            formData.append(key, item);
          });
          return;
        }
        formData.append(key, obj[key]);
      });
    return formData;
  }





export{
    previewPdf,
    downloadDocx,
    uploadTemplate,
    deleteTemplate,
    getErrorLog,
    getTemplate,
    getTemplateRootPath
}