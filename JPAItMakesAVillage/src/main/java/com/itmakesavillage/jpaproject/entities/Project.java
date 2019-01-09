package com.itmakesavillage.jpaproject.entities;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;

@Entity
public class Project {
	private int id;
	private String title;
	private boolean active;
	private int ownerId;
	private Date startDate;
	private Date endDate;
	private String desription;
	private Address address;
	private Time time;
	private int hoursNeeded;
	private int volunteersNeeded;
	private List<Volunteer> volunteers;
	private List<Category> categories;
}
