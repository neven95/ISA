package com.websystique.springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="kulturni_objekat")
public class CulturalObject {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@Column(name="naziv")
	private String name;
	
	@Column(name="adresa")
	private String adress;
	
	@Column(name="sirina")
	private String width;
	
	@Column(name="duzina")
	private String length;
	
	@Column(name="promo_opis")
	private String promoDescription;
	
	@Column(name="tip")
	private String type;
	
	@Column(name="objekat_slika")
	private String imageSrc;

	@Column(name="grad")
	private String city;
	

	/*============================ getters and setters =============================*/
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getPromoDescription() {
		return promoDescription;
	}

	public void setPromoDescription(String promoDescription) {
		this.promoDescription = promoDescription;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getImage() {
		return imageSrc;
	}

	public void setImage(String imageSrc) {
		this.imageSrc = imageSrc;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "CulturalObject [id=" + id + ", name=" + name + ", adress=" + adress + ", width=" + width + ", length="
				+ length + ", promoDescription=" + promoDescription + ", type=" + type + ", imageSrc=" + imageSrc +  "]";
	}

	public CulturalObject(Long id, String name, String adress, String width, String length, String promoDescription,
			String type, String imageSrc, String city) {
		this.id = id;
		this.name = name;
		this.adress = adress;
		this.width = width;
		this.length = length;
		this.promoDescription = promoDescription;
		this.type = type;
		this.imageSrc = imageSrc;
		this.city = city;
	}
	public CulturalObject(){
		
	}
	
	
}
