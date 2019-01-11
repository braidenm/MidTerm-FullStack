package com.itmakesavillage.bootproject.data;

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

	
}
