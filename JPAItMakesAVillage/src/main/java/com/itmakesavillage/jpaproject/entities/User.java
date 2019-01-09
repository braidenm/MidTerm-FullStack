package com.itmakesavillage.jpaproject.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private int id;
	@Column(name="user_name")
	private String userName;
	private String password;
	private String email;
	private String role;
}
