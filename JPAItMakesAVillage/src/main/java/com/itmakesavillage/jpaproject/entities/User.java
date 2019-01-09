package com.itmakesavillage.jpaproject.entities;

import javax.persistence.Entity;

@Entity
public class User {
	private int id;
	private String userName;
	private String password;
	private String email;
	private String role;
}
