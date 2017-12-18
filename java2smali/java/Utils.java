package cn.wjdiankong.androiddemo;

import java.security.MessageDigest;

public class Utils {
	
    private static char[] a = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    
    public static String a(String str) {
        return a(str.getBytes());
    }
    
    public static String a(byte[] bArr) {
        String str = null;
        try {
            MessageDigest instance = MessageDigest.getInstance("MD5");
            instance.update(bArr);
            str = b(instance.digest());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return str;
    }

    private static String b(byte[] bArr) {
        int i = 0;
        int length = bArr.length;
        char[] cArr = new char[(length * 2)];
        int i2 = 0;
        while (i < length) {
            byte b = bArr[i];
            int i3 = i2 + 1;
            cArr[i2] = a[(b >>> 4) & 15];
            i2 = i3 + 1;
            cArr[i3] = a[b & 15];
            i++;
        }
        return new String(cArr);
    }

}
