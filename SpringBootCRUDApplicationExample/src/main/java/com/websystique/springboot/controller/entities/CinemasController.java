package com.websystique.springboot.controller.entities;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.websystique.springboot.model.CulturalObject;
import com.websystique.springboot.service.CulturalObjectServiceImpl;

@RestController
@RequestMapping("/cinemasApi")
public class CinemasController {
	
	@Autowired
	private CulturalObjectServiceImpl cinemaService;
	
	public CinemasController(CulturalObjectServiceImpl cinemaService) {
		super();
		this.cinemaService = cinemaService;
	}



	@RequestMapping(value="/cinemas", method=RequestMethod.GET)
	public ResponseEntity<?> getCinemas(){
		System.out.println("Upapp*o*o*********************************");
		List<CulturalObject> cinemasList = cinemaService.findAllObjects();
		System.out.println(cinemasList.get(0));
		if(cinemasList.isEmpty()){
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CulturalObject>>(cinemasList, HttpStatus.OK);
	}
	
}