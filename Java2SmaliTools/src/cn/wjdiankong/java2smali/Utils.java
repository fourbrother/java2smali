package cn.wjdiankong.java2smali;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.InputStreamReader;

public class Utils {
	
	/**
	 * 执行命令
	 * @param cmd
	 * @param isOutputLog
	 * @return
	 */
	public static boolean execCmd(String cmd, boolean isOutputLog){
		BufferedReader br = null;
		try {
			Process p = Runtime.getRuntime().exec(cmd);
			br = new BufferedReader(new InputStreamReader(p.getInputStream()));
			String line = null;
			while ((line = br.readLine()) != null) {
				if(isOutputLog)
					System.out.println(line);
			}
		} catch (Exception e) {
			System.out.println("cmd error:"+e.toString());
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return true;
	}
	
	/** 
	 * 文件拷贝的方法 
	 */  
	public static boolean fileCopy(String src, String des) {  
		FileInputStream fis = null;
		FileOutputStream fos = null;
		try {  
			fis = new FileInputStream(src);
			fos = new FileOutputStream(des);
			int len = 0;
			byte[] buffer = new byte[10*1024];
			while((len=fis.read(buffer)) > 0){  
				fos.write(buffer, 0, len);
			}  
		} catch (Exception e) {  
			System.out.println("拷贝文件失败:"+e.toString());
			return false;
		}finally{  
			try {  
				if(fis!=null)  fis.close();  
				if(fos!=null)  fos.close();  
			} catch (Exception e) {  
				System.out.println("拷贝文件失败:"+e.toString());
				return false;
			} 
		}
		return true;
	}    
	
	public static String getClassName(String javaName){
		try{
			int index = javaName.indexOf(".");
			return javaName.substring(0, index)+".class";
		}catch(Exception e){
			return javaName;
		}
	}
	
	public static String getFileName(String javaName){
		try{
			int index = javaName.indexOf(".");
			return javaName.substring(0, index);
		}catch(Exception e){
			return javaName;
		}
	}
	
	/**
	 * 获取SDK的xml中配置信息
	 * @param fileName
	 */
	public static String getClassPkgName(String fileName){  
		FileReader fr = null;
		BufferedReader br = null;
        try {  
            fr = new FileReader(fileName);
            br = new BufferedReader(fr);
            String line = null;
            while((line = br.readLine()) != null){
            	if(line != null){
            		if(line.startsWith("package")){
            			return line.split("package")[1].replace(";", "").trim();
            		}
            	}
            }
        } catch (Exception e) {  
            return null;
        } finally{
        	if(fr != null){
        		try{
        			fr.close();
        		}catch(Exception e){
        		}
        	}
        	if(br != null){
        		try{
        			br.close();
        		}catch(Exception e){
        		}
        	}
        }
        return null;
    } 

}
