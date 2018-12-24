package org.ehk0429.service;

import java.io.*;
import java.net.*;

import org.ehk0429.domain.TranslationVO;
import org.springframework.stereotype.Service;

@Service
public class TranslationServiceImple implements TranslationService {
	 String clientId = "e7lnl3aW91VldLr4BGAo";//애플리케이션 클라이언트 아이디값";
     String clientSecret = "DU1VmDIsRw";//애플리케이션 클라이언트 시크릿값";
     String apiURL = "https://openapi.naver.com/v1/language/translate"; // SMT NAVER API
     
	@Override
	public String getTranslatedText(String text, String source, String target) {
		 try {
	           URLEncoder.encode(text, "UTF-8");
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("POST");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            // post request
	            String postParams = "source=" + source + "&target=" + target + "&text=" + text;
	            con.setDoOutput(true);
	            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	            wr.writeBytes(postParams);
	            wr.flush();
	            wr.close();
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	            System.out.println(response.toString());
	            return response.toString();
	        } catch (Exception e) {
	            System.out.println(e);
	        }
		return null;
	}
}
