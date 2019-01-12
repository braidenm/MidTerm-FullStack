package com.itmakesavillage.bootproject.data;

import java.util.List;

import com.itmakesavillage.jpaproject.entities.ProjectVolunteer;

public interface ProjectVolunteerDAO {
	
//	public ProjectVolunteer addPV();
//	public ProjectVolunteer removePV();
	public ProjectVolunteer updatePV(ProjectVolunteer pv);
	public ProjectVolunteer findPV(int projectId, int volunteerId);
	public List<ProjectVolunteer> findPVbyProjectId(int projectId);

}
