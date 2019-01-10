package com.itmakesavillage.bootproject.data;

import java.util.List;
import java.util.Set;

import com.itmakesavillage.jpaproject.entities.Volunteer;


public interface VolunteerDAO {
	
	
	public Volunteer findVolunteer(int id);
	public Volunteer createVolunteer(Volunteer volunteer);
	public Volunteer updateVolunteer(int id, Volunteer volunteer);
	public Set<Volunteer> searchVolunteer(String Keyword);
	public List<Volunteer> getAllVolunteer();

}
