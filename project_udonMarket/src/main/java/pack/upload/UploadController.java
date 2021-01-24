package pack.upload;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {
	
	@Autowired
	private FileValidator fileValidator;
	
	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public String getForm(
							@ModelAttribute("uploadFile") UploadFile uploadFile
						) {
		return "insform"; 
	}
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public ModelAndView fileSubmit(
			@ModelAttribute("uploadFile") UploadFile uploadFile,
			BindingResult result
								) {
		InputStream inputStream = null;
		OutputStream outputStream = null; 
		
		//업로드된 파일에 대한 에러 검사
		MultipartFile file = uploadFile.getFile();
		fileValidator.validate(uploadFile, result);
				
		String fileName = file.getOriginalFilename();
		if(result.hasErrors()) { 
			return new ModelAndView("insform");
		}
		try {
			inputStream = file.getInputStream();
				File newFile = new File("../../src/main/webapp/resources/upload/" 
									+ fileName);
				if(!newFile.exists()) { 
					newFile.createNewFile();
				}
			
			outputStream = new FileOutputStream(newFile);
				int read = 0;
				byte[] bytes = new byte[1024]; 
				
				while((read = inputStream.read(bytes)) != -1) { //읽을게 있으면
					outputStream.write(bytes,0,read);			//계속 써준다
				}
		} catch (Exception e) {
			System.out.println("fileSubmit err : "+e);
		}finally {
			try {
				outputStream.close();
			} catch (Exception e2) {
			}
		}
		return new ModelAndView("detail", "filename", fileName);
	}
}
