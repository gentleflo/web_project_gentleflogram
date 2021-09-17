package com.gentleflo.gentleflogram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	public final static String FILE_UPLOAD_PATH ="C:\\Users\\LEE\\Desktop\\springTest\\gentleflogramImg_upload\\images/";

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
}
