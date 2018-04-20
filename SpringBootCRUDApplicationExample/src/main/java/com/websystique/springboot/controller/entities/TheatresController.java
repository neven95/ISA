package com.websystique.springboot.controller.entities;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.websystique.springboot.model.CulturalObject;
import com.websystique.springboot.model.User;
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
	
	@RequestMapping(value="/registerObject", method=RequestMethod.POST)
	public ResponseEntity<?> createObject(@RequestBody CulturalObject object, UriComponentsBuilder ucBuilder) {
		System.out.println("*********************************CREATING OBJECT************************************");
		System.out.println(object);
		theatreService.saveObject(object);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/theatresApi/registerObject/{id}").buildAndExpand(object.getId()).toUri());
		return new ResponseEntity<User>(headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/registerObject", method = RequestMethod.GET)
	public ResponseEntity<List<CulturalObject>> loadAllObjects() {
		List<CulturalObject> objects = theatreService.findAllObjects();
		//System.out.println();
		if (objects.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
			// You many decide to return HttpStatus.NOT_FOUND
		}
		return new ResponseEntity<List<CulturalObject>>(objects, HttpStatus.OK);
	}
}
