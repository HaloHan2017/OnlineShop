package com.yc.olshop.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class IpUtils {
	public static String getWebIp() {
		try {

			URL url = new URL("http://www.ip138.com");

			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));

			String s = "";

			StringBuffer sb = new StringBuffer("");

			String webContent = "";

			while ((s = br.readLine()) != null) {
				sb.append(s + "\r\n");

			}

			br.close();
			webContent = sb.toString();
			int start = webContent.indexOf("[") + 1;
			int end = webContent.indexOf("]");
			webContent = webContent.substring(start, end);

			return webContent;

		} catch (Exception e) {
			e.printStackTrace();
			return "error";

		}
	}

	public static String getV4IP() {
		String ip = "";
		String chinaz = "http://ip.chinaz.com";

		StringBuilder inputLine = new StringBuilder();
		String read = "";
		URL url = null;
		HttpURLConnection urlConnection = null;
		BufferedReader in = null;
		try {
			url = new URL(chinaz);
			urlConnection = (HttpURLConnection) url.openConnection();
			in = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
			while ((read = in.readLine()) != null) {
				inputLine.append(read + "\r\n");
			}
			// System.out.println(inputLine.toString());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		Pattern p = Pattern.compile("\\<dd class\\=\"fz24\">(.*?)\\<\\/dd>");
		Matcher m = p.matcher(inputLine.toString());
		if (m.find()) {
			String ipstr = m.group(1);
			ip = ipstr;
			// System.out.println(ipstr);
		}
		return ip;
	}

	public static String publicip() {
		URL url = null;
		URLConnection urlconn = null;
		BufferedReader br = null;
		try {
			url = new URL("http://www.ip138.com/ips1388.asp");// 爬取的网站是百度搜索ip时排名第一的那个
			urlconn = url.openConnection();
			br = new BufferedReader(new InputStreamReader(urlconn.getInputStream()));
			String buf = null;
			String get = null;
			while ((buf = br.readLine()) != null) {
				get += buf;
			}
			int where, end;
			for (where = 0; where < get.length() && get.charAt(where) != '['; where++)
				;
			for (end = where; end < get.length() && get.charAt(end) != ']'; end++)
				;
			get = get.substring(where + 1, end);
			return get;
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public static void main(String[] args) {
		System.out.println("--" + IpUtils.publicip());
	}
}
