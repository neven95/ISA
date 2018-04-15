package com.websystique.springboot.controller.entities;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.websystique.springboot.model.CulturalObject;
import com.websystique.springboot.service.TheatresServiceImpl;

@RestController
@RequestMapping("/theatresApi")
public class TheatresController {

	@Autowired
	private TheatresServiceImpl theatreService;

	public TheatresController(TheatresServiceImpl theatreService) {
		this.theatreService = theatreService;
	}
	
	@RequestMapping(value="/theatres", method=RequestMethod.GET)
	public ResponseEntity<?> getTheatres() {
		System.out.println("Upapp*o*o*********************************");
		List<CulturalObject> theatresList = theatreService.findAllObjects();
		
		if(theatresList.isEmpty())
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		return new ResponseEntity<List<CulturalObject>>(theatresList, HttpStatus.OK);
	}
	
}
