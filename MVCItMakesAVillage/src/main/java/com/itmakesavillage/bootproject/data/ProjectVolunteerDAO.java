package com.itmakesavillage.bootproject.data;

import com.itmakesavillage.jpaproject.entities.ProjectVolunteer;

public interface ProjectVolunteerDAO {
	
//	public ProjectVolunteer addPV();
//	public ProjectVolunteer removePV();
	public ProjectVolunteer updatePV(ProjectVolunteer pv);
	public ProjectVolunteer findPV(int projectId, int volunteerId);

}
