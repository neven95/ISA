package com.websystique.springboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

import com.websystique.springboot.model.CulturalObject;

public interface CulturalObjectRepository extends JpaRepository<CulturalObject, Long>{

	public CulturalObject findByName(String name);
	
	//@Query("SELECT * FROM CulturalObject c WHERE c.tip = \'bioskop\'")
	@Query("SELECT c FROM CulturalObject c where LOWER(c.type) = \'bioskop\'")
	public List<CulturalObject> queryCinemas();
	
	@Query("SELECT c FROM CulturalObject c where LOWER(c.type) = \'pozoriste\'")
	public List<CulturalObject> queryTheatres();
}
