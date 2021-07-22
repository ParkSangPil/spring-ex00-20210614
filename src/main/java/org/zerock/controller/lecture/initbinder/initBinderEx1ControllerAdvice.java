package org.zerock.controller.lecture.initbinder;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;
import org.zerock.controller.lecture.initbinder.InitBinderEx1Controller.MyData;
import org.zerock.controller.lecture.initbinder.InitBinderEx1Controller.MyDataEditor;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class initBinderEx1ControllerAdvice {

//	@InitBinder
//	public void method1() {
//		log.info("advice method1");
//	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		log.info("init binder");
		
		binder.registerCustomEditor(MyData.class, new MyDataEditor());
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
}
