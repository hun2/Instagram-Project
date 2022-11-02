package com.example.demo.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerServices {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	//실제 이미지가 저장될 경로를 변수선언.
	public static final String FILE_UPLOAD_PATH = "C:\\Users\\User\\Desktop\\workspace\\images/";

	
	public String saveFile(String uid, MultipartFile file) {
		//uid와 파일을 파라미터로 던져준다.
		//파일 디렉토리 예 ) kihun_20221024/exmple.png          
		// 예)  아이디_올린시간/파일명. 파일명은 앵간하면 영어로.
		
		//파일 경로 설정
		String directoryName = uid + "_" + System.currentTimeMillis() + "/";           // kihun_20221024 까지 쓴거임.
		String filePath = FILE_UPLOAD_PATH + directoryName; // C:\\Users\\User\\Desktop\\workspace\\images/test20_20221024/"
		
		
		//파일 저장 설정
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			return null;
		}
		
		//파일 업로드 byte 단위로 설정
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
			return  null;
		}
		//성공시 이미지 url path 를 리턴
		return "/images/" + directoryName + file.getOriginalFilename();
	}

	
	public void deleteFile(String profilePhoto) {
		Path path = Paths.get(FILE_UPLOAD_PATH + profilePhoto.replace("/images/", ""));
		
		//파일삭제
		if ( Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				log.error("[이미지 삭제] 이미지 삭제 실패 boardImage : {}" , profilePhoto);
			}
		}
		//폴더삭제
		path = path.getParent();
		if( Files.exists(path)){
			try {
				Files.delete(path);
			} catch (IOException e) {
				log.error("[디렉토리 삭제] 디렉토리 삭제 실패 boardImage : {}" , profilePhoto);
			}
		}
	}
	
	
	
	
}
