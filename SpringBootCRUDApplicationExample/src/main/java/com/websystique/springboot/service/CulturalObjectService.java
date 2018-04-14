package com.websystique.springboot.service;

import java.util.List;

import com.websystique.springboot.model.CulturalObject;
import com.websystique.springboot.model.User;

public interface CulturalObjectService {

	CulturalObject findById(Long id);

	CulturalObject findByName(String naziv);

	void saveObject(CulturalObject culturalObject);

	void updateObject(CulturalObject culturalObject);

	void deleteObjectById(Long id);

	void deleteAllObjects();

	List<CulturalObject> findAllObjects();

	boolean isObjectExist(CulturalObject culturalObject);
	
}
