package member.common;
import java.nio.charset.Charset;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PasswordWrapper extends HttpServletRequestWrapper {

	public PasswordWrapper(HttpServletRequest request) {
		super(request);
		
	}
	
	@Override
	public String getParameter(String name) {
		if(name != null && name.equals("userPwd")) {
			// 널값이 아니고 비번값이 들어온다면?!
			name = getSHA512(super.getParameter(name));
			
		} else {
			// 그렇지않고 널이거나 비번이 아닌 아이디같은게 들어온다면?!
			name = super.getParameter(name);
		}
		
		return name;
	}
						  // 암호화 방식 중 하나 SHA-512
	public static String getSHA512(String pwd) {
			
		try {
			
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			
			byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
		
			return Base64.getEncoder().encodeToString(md.digest());
		
		} catch (NoSuchAlgorithmException e) {
			System.out.println("암호화 에러 발생!");
			
			e.printStackTrace();
			return null;
		}
		
	}

}
