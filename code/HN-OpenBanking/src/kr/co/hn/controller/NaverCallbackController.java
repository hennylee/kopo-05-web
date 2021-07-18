package kr.co.hn.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import kr.co.hn.vo.MemberVO;

// api 명세 : https://developers.naver.com/docs/login/profile/profile.md
// 코드 출처 : https://devtansan-s-tocking.tistory.com/17?category=811719

public class NaverCallbackController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		/*
		 * https://nid.naver.com/oauth2.0/token?grant_type=authorization_code
		 * &client_id=jyvqXeaVOVmV &client_secret=527300A0_COq1_XV33cf
		 * &code=EIc5bFrl4RibFls1 &state=9kgsGTfH4j7IyAkg
		 */

		HttpSession session = request.getSession();
		String code = request.getParameter("code");
		String state = (String) session.getAttribute("state");
			
		JSONObject jsonObj = getAccessToken(code, state);
		
		if (jsonObj != null) {
			
			JSONObject resObj = getAuthInfo(jsonObj);
			
			if (resObj != null) {
				
				String naverCode = (String)resObj.get("id");
				String email = (String)resObj.get("email");
				String name = (String)resObj.get("name");
				
				String[] emails = email.split("@");
				
				MemberVO member = new MemberVO();
				member.setPassword(naverCode);
				member.setEmailId(emails[0]);
				member.setEmailDomain(emails[1]);
				member.setName(name);
				
				session.setAttribute("member", member);
				
			}
		}
		
		return "/member/naverJoin.jsp";
	}
	
	
	private JSONObject getAccessToken(String code, String state) {

		StringBuilder apiURL = new StringBuilder("https://nid.naver.com/oauth2.0/token?grant_type=authorization_code");

		apiURL.append("&client_id=" + NaverLoginController.CLIENT_ID);
		apiURL.append("&client_secret=" + NaverLoginController.CLIENT_SECRET);
		apiURL.append("&code=" + code);
		apiURL.append("&state=" + state);

		try {

			URL url = new URL(apiURL.toString());
			HttpURLConnection http = (HttpURLConnection) url.openConnection();
			http.setRequestMethod("GET");

			int responseCode = http.getResponseCode();
			BufferedReader br;

			// 정상 호출이라면?
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(http.getInputStream()));
			}
			// 에러가 발생했다면?
			else {
				br = new BufferedReader(new InputStreamReader(http.getErrorStream()));
			}

			String inputLine;
			StringBuffer res = new StringBuffer();

			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}

			br.close();


			/*
			 * {"access_token":
			 * "AAAAOPiL-yoMiCDKe5X1phnM_HEmyStEXXurRI-KGZJc-kUHgn_EDVONxHLD6dqwBgQDUHInG11Ly_X1xcfh31tQJCk"
			 * ,"refresh_token":
			 * "jX2j5isgfZK0Ziizt745qzFT3X4gTpGqfhipo4AJwlaMBziiMssDej1VisTKUWGfisdnnT0jhbWF4iscdJNcuY7Kii5214gFipfzv2PQIQWQjisCASLkcie"
			 * ,"token_type":"bearer","expires_in":"3600"}
			 */

			JSONParser parsing = new JSONParser();
			Object obj = parsing.parse(res.toString());
			JSONObject jsonObj = (JSONObject) obj;

			return jsonObj;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
	
	private JSONObject getAuthInfo(JSONObject jsonObj) throws IOException, ParseException {
		
		String access_token = (String) jsonObj.get("access_token");
		String refresh_token = (String) jsonObj.get("refresh_token");

		String apiURL = "https://openapi.naver.com/v1/nid/me";
		String header = "Bearer " + access_token; // Bearer 다음에 공백 추가
		try {

			URL url = new URL(apiURL);
		
			HttpURLConnection http = (HttpURLConnection) url.openConnection();
			http.setRequestMethod("GET");
			http.setRequestProperty("Authorization", header);
	
			int responseCode = http.getResponseCode();
	
			BufferedReader br;
	
			// 정상호출
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(http.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(http.getErrorStream()));
			}
	
			String inputLine;
	
			StringBuffer res = new StringBuffer();
			
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
	
			JSONParser parsing = new JSONParser();
			Object obj = parsing.parse(res.toString());
			JSONObject jsonObj2 = (JSONObject)obj;
			JSONObject resObj = (JSONObject)jsonObj2.get("response");
			
			return resObj;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
