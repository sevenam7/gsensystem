package com.lm.util;

import java.io.File;

/**
 * 删除目录
 * 
 * @author @whf
 *
 */
public class DeleteDirectory {
	
	/**
	 * 
	 * @param path
	 */
	public static void DeleteDir(String path){
        // 获取删除目录/文件路径
		File Directory =new File(path);
        // 判断路径是否存在目录/路径
		if(Directory.exists()){
			// 获取删除路径下所有路径
            File[] ListFile = Directory.listFiles();
            for(int i=0; i<ListFile.length; i++){
                // 判断循环的某个路径是否目录
            	if(ListFile[i].isDirectory()){
            		DeleteDir(path+"/"+ListFile[i].getName());
                }
                else if(ListFile[i].isFile()){
                	ListFile[i].delete();
                }
            }
            Directory.delete();
        }
    }
	
	// 删除文件
	public static boolean DeleteFile(String path){
        boolean bol = false;// 定义返回值
		
		// 获取删除目录/文件路径
		File file =new File(path);
        try {
        	// 判断文件是否存在并且是否是文件
        	if(file.exists() && file.isFile()){
            	file.delete();// 如果是就删除
            	bol = true;
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
        return bol;
    }
	
	
}
