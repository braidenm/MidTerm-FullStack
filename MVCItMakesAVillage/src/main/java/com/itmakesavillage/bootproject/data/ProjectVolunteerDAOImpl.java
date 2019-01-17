package com.itmakesavillage.bootproject.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.itmakesavillage.jpaproject.entities.ProjectVolunteer;

@Transactional
@Service
public class ProjectVolunteerDAOImpl implements ProjectVolunteerDAO {

	@PersistenceContext
	EntityManager em;

	@Override
	public ProjectVolunteer updatePV(ProjectVolunteer pv) {
		ProjectVolunteer managed = em.find(ProjectVolunteer.class, pv.getId());
		managed.setHoursActual(pv.getHoursActual());
		managed.setHoursPledged(pv.getHoursPledged());
		managed.setProject(pv.getProject());
		managed.setVolunteer(pv.getVolunteer());
		managed.setItemscommitted(pv.getItemscommitted());
		return managed;
	}

	@Override
	public ProjectVolunteer findPV(int projectId, int volunteerId) {
		
		List<ProjectVolunteer> pvList = null;
		List<ProjectVolunteer> pvVolunteerList = new ArrayList<ProjectVolunteer>();
		String query = "SELECT pv FROM ProjectVolunteer pv";
		pvList = em.createQuery(query, ProjectVolunteer.class).getResultList();
		
		for (ProjectVolunteer pv : pvList) {
			if(pv.getVolunteer().getUserid() == volunteerId) {
				pvVolunteerList.add(pv);
			}
		}
		for (ProjectVolunteer pv : pvVolunteerList) {
			if(pv.getProject().getId() == projectId) {
				return pv;
			}
		}
//		ProjectVolunteer managed = em.find(ProjectVolunteer.class, 1 );
		return null;
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

	@Override
	public ProjectVolunteer createPV(ProjectVolunteer pv) {
		em.persist(pv);
		
		return pv;
	}

	@Override
	public List<ProjectVolunteer> getAllProjectVolunteers() {
		List<ProjectVolunteer> pvList = new ArrayList<ProjectVolunteer>();
		String query = "select pv from ProjectVolunteer pv";
		pvList = em.createQuery(query, ProjectVolunteer.class).getResultList();
		return pvList;
	}
	@Override
	public ProjectVolunteer findPVById(int id) {
		
		return em.find(ProjectVolunteer.class, id);
	}
	
	
	
	
	
}
