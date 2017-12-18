package cn.wjdiankong.java2smali;

import java.io.File;
import java.util.HashMap;

public class Java2SmaliTools {
	
	public static final String JAVADIR = "java";
	public static final String SMALIDIR = "smali";
	public static final String CLASSDIR = "classes";
	
	public static final String sysSeparator = File.separator;
	
	public static final String JAVA_PATH = JAVADIR + sysSeparator;
	public static final String SMALI_PATH = JAVADIR + sysSeparator;
	public static final String CLASS_PATH = CLASSDIR + sysSeparator;
	
	public static final String DEXNAME = SMALI_PATH+"classes.dex";
	
	public static final HashMap<String, String> classNamePkgMap = new HashMap<String, String>();
	
	public static void main(String[] args){
		
		//第一步：编译java文件夹下面所有的java文件
		File javaDirFile = new File(JAVADIR);
		if(!javaDirFile.exists()){
			System.out.println("java dir is not exist!");
			return;
		}
		File classDirFile = new File(CLASSDIR);
		if(!classDirFile.exists()){
			classDirFile.mkdirs();
		}
		
		String javaCmd = "javac -classpath lib" + sysSeparator + "android.jar " + JAVA_PATH + "*.java";
		boolean isSucc = Utils.execCmd(javaCmd, false);
		if(!isSucc){
			System.out.println("compile java file: is error!");
			return;
		}
		
		File[] javaFileList = javaDirFile.listFiles();
		for(File javaF : javaFileList){
			if(javaF.getName().endsWith(".java")){
				String pkgName = Utils.getClassPkgName(javaF.getAbsolutePath());
				if(pkgName == null){
					continue;
				}
				pkgName = pkgName.replace(".", sysSeparator);
				File dir = new File(CLASS_PATH+pkgName);
				if(!dir.exists()){
					dir.mkdirs();
				}
				classNamePkgMap.put(Utils.getFileName(javaF.getName()), pkgName);
			}
		}
		for(File classF : javaFileList){
			if(classF.getName().endsWith(".class")){
				String pkgName = classNamePkgMap.get(Utils.getFileName(classF.getName()));
				File classFile = new File(JAVA_PATH+classF.getName());
				boolean isCopySucc = Utils.fileCopy(classFile.getAbsolutePath(), 
						CLASS_PATH+pkgName+sysSeparator+classF.getName());
				if(!isCopySucc){
					System.out.println("copy class file:"+classF.getName()+" is error!");
				}else{
					classFile.delete();
				}
			}
		}
		
		//第二步：利用dx命令将class文件变成dex文件
		File smaliDirFile = new File(SMALIDIR);
		if(!smaliDirFile.exists()){
			smaliDirFile.mkdirs();
		}
		String dxCmd = "java -jar lib" + sysSeparator + "dx.jar --dex --output=" + DEXNAME + " " + CLASSDIR;
		boolean isdxSucc = Utils.execCmd(dxCmd, false);
		if(!isdxSucc){
			System.out.println("class file to classes.dex is error!");
			return;
		}
		
		//第三步：利用smali将dex文件变成smali文件
		String smaliCmd = "java -jar lib" + sysSeparator + "baksmali.jar -o " + SMALIDIR + " " + DEXNAME;
		boolean smaliSucc = Utils.execCmd(smaliCmd, false);
		if(!smaliSucc){
			System.out.println("dex to smali is error!");
			return;
		}else{
			File classDexFile = new File(DEXNAME);
			if(classDexFile.exists()){
				classDexFile.delete();
			}
		}
		
		//第四步：删除classes目录
		if(classDirFile.exists()){
			classDirFile.delete();
		}
	}

}
