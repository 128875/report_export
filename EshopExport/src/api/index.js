const baseUrl = "http://192.168.9.75:8872"
const palletUrl = "http://192.168.9.75:8000"
// const baseUrl =  "http://192.168.0.83:8872"
// const palletUrl =  "http://192.168.0.83:8000"


export default {

	//通过产品编号获得产品信息
	getItemInfoByCpbh: baseUrl + "/3DPallet/getItemInfoByCpbh",
	// 获取装托结果
	getAllocationPalletData: palletUrl + "/box3D_mark",
}


