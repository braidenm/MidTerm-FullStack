package com.itmakesavillage.jpaproject.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
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
	@OneToMany(mappedBy="volunteer")
	private List<ProjectVolunteer> projectVolunteers;
	@OneToMany(mappedBy="owner")
	private List<Project> ownedProjects;
	
	
	public List<Project> getOwnedProjects() {
		return ownedProjects;
	}

	public void setOwnedProjects(List<Project> ownedProjects) {
		this.ownedProjects = ownedProjects;
	}

	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
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
	
	public void addProject(Project project) {
		if(projects == null) {
			projects = new ArrayList<Project>();
		}
		if(!projects.contains(project)) {
			projects.add(project);
			project.addVolunteer(this);
		}
	}
	public void removeProject(Project project) {
		if(projects != null && projects.contains(project)) {
			projects.remove(project);
			project.removeVolunteer(this);
		}
	}
}
