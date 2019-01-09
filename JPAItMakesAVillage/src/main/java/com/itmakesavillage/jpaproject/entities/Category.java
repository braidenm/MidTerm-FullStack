package com.itmakesavillage.jpaproject.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Category {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private int id;
	private String name;
	private String description;
}
