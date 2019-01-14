package com.itmakesavillage.bootproject.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.itmakesavillage.jpaproject.entities.ProjectVolunteer;
import com.itmakesavillage.jpaproject.entities.ProjectVolunteerId;

@Transactional
@Service
public class ProjectVolunteerDAOImpl implements ProjectVolunteerDAO {

	@PersistenceContext
	EntityManager em;

	@Override
	public ProjectVolunteer updatePV(ProjectVolunteer pv) {
		ProjectVolunteer managed = em.find(ProjectVolunteer.class, pv.getId());
		managed = pv;
		return managed;
	}

	@Override
	public ProjectVolunteer findPV(int projectId, int volunteerId) {
		ProjectVolunteer managed = em.find(ProjectVolunteer.class, new ProjectVolunteerId(projectId, volunteerId));
		return managed;
	}

	@Override
	public List<ProjectVolunteer> findPVbyProjectId(int projectId) {
		
		List<ProjectVolunteer> pvList = new ArrayList<ProjectVolunteer>();
		List<ProjectVolunteer> pvListProject = new ArrayList<ProjectVolunteer>();
		String query = "select pv from ProjectVolunteer pv";
		pvList = em.createQuery(query, ProjectVolunteer.class).getResultList();
		for (ProjectVolunteer pv : pvList) {
			if(pv.getProject().getId() == projectId) {
				pvListProject.add(pv);
			}
		}
		
		System.out.println(pvList);
		return pvList;
	}

	
}
