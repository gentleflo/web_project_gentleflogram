package com.gentleflo.gentleflogram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	public final static String FILE_UPLOAD_PATH ="D:\\이나은\\gentleflogram_upload/";

	public static String saveFile(int userId, MultipartFile file) {
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		// 파일 디렉토리 생성
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			return null;
		}
		
		try {
			byte[] bytes = file.getBytes();
			// 파일 경로
			Path path = Paths.get(filePath + file.getOriginalFilename());
			// 파일 저장
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return "/images/" + directoryName + file.getOriginalFilename();
	}
	
	public static void removeFile(String filePath) {
		String realFilePath = FILE_UPLOAD_PATH + filePath.replace("/images/", "");
		
		Path path = Paths.get(realFilePath); // path는 파일경로를 좀 더 다루기 쉽게 해놓은 클래스임
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} 
		
		// 디렉토리(폴더) 삭제
		path = path.getParent();
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
