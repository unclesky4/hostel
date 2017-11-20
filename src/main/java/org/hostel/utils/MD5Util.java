package org.hostel.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
* MD5加密
* @author unclesky4
* @date Oct 21, 2017 11:06:07 AM
*
*/

public class MD5Util {
	
	public static String Encrypt(String plainText) {
		String re_md5 = new String();
        String text = plainText + "$5&***Ja";
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(text.getBytes());
            byte b[] = md.digest();
 
            int i;
 
            StringBuilder stringBuilder = new StringBuilder("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                	stringBuilder.append("0");
                stringBuilder.append(Integer.toHexString(i));
            }
 
            re_md5 = stringBuilder.toString();
 
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return re_md5;
	}

}
