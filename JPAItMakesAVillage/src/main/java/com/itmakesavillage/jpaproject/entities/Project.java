package com.itmakesavillage.jpaproject.entities;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Project {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private int id;
	private String title;
	private boolean active;
	@Column(name="owner_id")
	private int ownerId;
	@Column(name="start_date")
	private Date startDate;
	@Column(name="end_date")
	private Date endDate;
	private String description;
	
	private Address address;
	private Time time;
	@Column(name="hours_needed")
	private int hoursNeeded;
	@Column(name="volunteer_needed")
	private int volunteersNeeded;
	private List<Volunteer> volunteers;
	private List<Category> categories;
}
