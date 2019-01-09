package com.itmakesavillage.jpaproject.entities;

import java.util.Date;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Volunteer {

	@Id
	@Column(name="user_id")
	private int userid;
	
	@Column(name="phone_number")
	private String phone;
	
	
	@Temporal(TemporalType.DATE)
	private Date dob;
	
	@Column(name="address_id")
	private int addressId;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	@Column(name="picture_url")
	private String  pictureURL;
	
	private String about;
	
	@OneToOne
	@JoinColumn(name="user_id")
	private User user;
	
	
	@ManyToMany
	@JoinTable(name="project_volunteer", joinColumns=@JoinColumn(name="project_id"), inverseJoinColumns=@JoinColumn(name="volunteer_id"))
	private List<Project> projects;
	
	
	private List<ProjectVolunteer> projectVolunteers;
	
	public List<Project> getProjects() {
		return projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}

	public List<ProjectVolunteer> getProjectVolunteers() {
		return projectVolunteers;
	}

	public void setProjectVolunteers(List<ProjectVolunteer> projectVolunteers) {
		this.projectVolunteers = projectVolunteers;
	}

	public Volunteer() {
		super();
	}

	public Volunteer(int userid, String phone, Date dob, int addressId, String firstName, String lastName,
			String pictureURL, String about) {
		super();
		this.userid = userid;
		this.phone = phone;
		this.dob = dob;
		this.addressId = addressId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.pictureURL = pictureURL;
		this.about = about;
	}

	@Override
	public String toString() {
		return "Volunteer [userid=" + userid + ", phone=" + phone + ", dob=" + dob + ", addressId=" + addressId
				+ ", firstName=" + firstName + ", lastName=" + lastName + ", pictureURL=" + pictureURL + ", about="
				+ about + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((about == null) ? 0 : about.hashCode());
		result = prime * result + addressId;
		result = prime * result + ((dob == null) ? 0 : dob.hashCode());
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + ((pictureURL == null) ? 0 : pictureURL.hashCode());
		result = prime * result + userid;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Volunteer other = (Volunteer) obj;
		if (about == null) {
			if (other.about != null)
				return false;
		} else if (!about.equals(other.about))
			return false;
		if (addressId != other.addressId)
			return false;
		if (dob == null) {
			if (other.dob != null)
				return false;
		} else if (!dob.equals(other.dob))
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (pictureURL == null) {
			if (other.pictureURL != null)
				return false;
		} else if (!pictureURL.equals(other.pictureURL))
			return false;
		if (userid != other.userid)
			return false;
		return true;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPictureURL() {
		return pictureURL;
	}

	public void setPictureURL(String pictureURL) {
		this.pictureURL = pictureURL;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}
}
