package org.ehk0429.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Service;

@Service
public class WorkServiceImple implements WorkService {
	ConvertJsonToMapService convertJsonToMapService = new ConvertJsonToMapService();
	String apiSearchURL = "http://api.saramin.co.kr/job-search"; // 사람인 검색 URL
	String apiDetailURL = "http://api.saramin.co.kr/job-search?id="; // 사람인 상세조회 URL
	// keywords string 기업명, 공고명, 업직종 키워드, 직무내용에서 검색하고자 하는 검색어
	// bbs_gb integer 공채구분 (1: 공채속보)
	// published 등록일
	// start integer 검색 결과 페이지 번호, 제로(0) 기반의 서수 번호 입니다. 기본값: 0
	// count integer 검색 결과 수, 기본값: 10, 최대값: 110

	@Override
	public List<Object> getWorkList(String keywords, int loc_mcd, int count) {
		// TODO XML -> JSON
		try {
			System.out.println(count);
			URLEncoder.encode(keywords, "UTF-8");
			URL url = new URL(apiSearchURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			// post request
			String postParams = "keywords=" + keywords + "&loc_mcd=" + loc_mcd + "&count=" + count;
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			JSONObject jsonObject = XML.toJSONObject(response.toString());
			JSONObject jobSearch = jsonObject.getJSONObject("job-search");
			JSONObject jobs = jobSearch.getJSONObject("jobs");
			JSONArray job = jobs.getJSONArray("job");
			System.out.println(job.toList());
			return job.toList();
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	@Override
	public String getWork(int id) {
		// TODO XML -> JSON
		return null;
	}

}
