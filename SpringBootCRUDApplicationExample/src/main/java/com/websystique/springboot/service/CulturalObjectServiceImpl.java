package com.websystique.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websystique.springboot.model.CulturalObject;
import com.websystique.springboot.repositories.CulturalObjectRepository;

@Service("culturalObjectService")
public class CulturalObjectServiceImpl implements CulturalObjectService {
	
	@Autowired
	private CulturalObjectRepository objectRepository;

	@Override
	public CulturalObject findById(Long id) {
		return objectRepository.findOne(id);
	}

	@Override
	public CulturalObject findByName(String naziv) {
		return objectRepository.findByName(naziv);
	}

	@Override
	public void saveObject(CulturalObject culturalObject) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateObject(CulturalObject culturalObject) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteObjectById(Long id) {
		// TODO Auto-generated method stub
	}

	@Override
	public void deleteAllObjects() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CulturalObject> findAllObjects() {
		return objectRepository.queryCinemas();
	}

	@Override
	public boolean isObjectExist(CulturalObject culturalObject) {
		// TODO Auto-generated method stub
		return false;
	}

}
