/**
 * Ajax 통신과 관련된 함수의 집합
 */
let httpRequest = null

function getXMLHttpRequest(){
	
	if(window.XMLHttpRequest)
		httpRequest = new XMLHttpRequest()
	else if(widow.ActiveXObject)
		httpRequest = new ActiveXObject("Microsoft.XMLHTTP")
	else
		httpRequest = null
		
	return httpRequest

}

function sendProcess(method, url, params, callback){
	
	// 1단계 : httpRequest 객체 얻기
	httpRequest = getXMLHttpRequest()
	
	// 2단계 : 콜백함수 설정
	httpRequest.onreadystatechange = callback
	
	// 다양한 제약조건에 따라 표준화 작업할 수 있도록 코드화 작업
	let httpMethod = method
	if(httpMethod != 'GET' && httpMethod != 'POST')
		httpMethod = 'GET'
	
	
	let httpParams = ''
	if(params != null && params != ''){
		
		
		// 1단계 params 추출 : params = 'name=hong&age=24&addr=서울시 서초구'
		// instanceof 는 new로 생성했을 때만 사용할 수 있다.
		if(typeof(params) ==  'string'){
			paramArr = params.split('&')
	
			for(let param of paramArr){
				pdata = param.split('=')
				
				if(httpParams != '')
					httpParams += '&'
				
				httpParams += pdata[0] + '=' + encodeURIComponent(pdata[1])
			}
		}
		// 3단계 params 추출 :  {name : '홍길동', age : 24, addr : '서울시 서초구'}
		else {
			for(let key in params){
				//console.log(key, params[key])
				if(httpParams != '')
					httpParams += '&'
				httpParams += key + '=' + encodeURIComponent(params[key])
				
			}
			
		}
		
	}
	
	
	let httpUrl = url
	if(httpMethod == 'GET' && httpParams != '')
		httpUrl = url + '?' + httpParams
		
	httpRequest.open(httpMethod, httpUrl, true)
	
	
	// send
	if(httpMethod == 'GET'){
		httpRequest.send(null)
	}
	else if(httpMethod == 'POST'){
		httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded')
		httpRequest.send(httpParams)
	}
		
}