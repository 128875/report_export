import request from '@/utils/request.js'
export function login(data) {
    return request({
        url: '/admin/login',
        method: 'post',
        headers: { 'Content-Type': 'application/form-data;boundary=' + new Date().getTime() },
        data: paramsToFormData(data),
    })
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