package com.itmakesavillage.bootproject.data;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.itmakesavillage.jpaproject.entities.Project;
import com.itmakesavillage.jpaproject.entities.Volunteer;

@Transactional
@Service
public class VolunteerDAOImpl implements VolunteerDAO {

	@PersistenceContext
	EntityManager em;

	@Override
	public Volunteer findVolunteer(int id) {
		Volunteer vol = em.find(Volunteer.class, id);
		return vol;
	}

	@Override
	public Volunteer createVolunteer(Volunteer volunteer) {
		volunteer.setAddressId(1);
		em.persist(volunteer);
		return volunteer;
	}

	@Override
	public Volunteer updateVolunteer(int id, Volunteer volunteer) {
		System.out.println("01");
		Volunteer managed = em.find(Volunteer.class, id);
		System.out.println("02");
		System.out.println(id +" " + volunteer);
		System.out.println("********"+volunteer.getProjects().get(0).getId());
		
		System.out.println("03");
		managed.setPhone(volunteer.getPhone());
		System.out.println("04");
		managed.setFirstName(volunteer.getFirstName());
		System.out.println("05");
		managed.setLastName(volunteer.getLastName());
		System.out.println("06");
		managed.setPictureURL(volunteer.getPictureURL());
		System.out.println("07");
		managed.setDob(volunteer.getDob());
		System.out.println("08");
		managed.setAbout(volunteer.getAbout());
		System.out.println("09");
//		managed.addProject(volunteer.getProjects().get(0));
		return managed;
	}

	@Override
	public Set<Volunteer> searchVolunteer(String keyword) {
		keyword = "%" + keyword + "%";
		keyword = keyword.replaceAll(" ", "% %");
		String wordsarr[] = keyword.split(" ");
		Set<Volunteer> vols = new HashSet<>();

		for (String word : wordsarr) {
			String qry = "SELECT vol FROM Volunteer vol WHERE vol.firstName LIKE :keyword OR vol.lastName LIKE :keyword";
			vols.addAll(em.createQuery(qry, Volunteer.class).setParameter("keyword", word).getResultList());
		}
		return vols;
	}

	@Override
	public List<Volunteer> getAllVolunteer() {
		String qry = "SELECT vol from Volunteer vols";
		List<Volunteer> vols = em.createQuery(qry, Volunteer.class).getResultList();
		return vols;
	}

	@Override
	public Volunteer updateVolunteer(int id, Volunteer volunteer, int projectId) {
		
		System.out.println("01");
		Volunteer managed = em.find(Volunteer.class, id);
		Project project = em.find(Project.class, projectId);
		System.out.println("02");
		System.out.println(id +" " + volunteer);
		System.out.println("********"+volunteer.getProjects().get(0).getId());
		
		System.out.println("03");
		managed.setPhone(volunteer.getPhone());
		System.out.println("04");
		managed.setFirstName(volunteer.getFirstName());
		System.out.println("05");
		managed.setLastName(volunteer.getLastName());
		System.out.println("06");
		managed.setPictureURL(volunteer.getPictureURL());
		System.out.println("07");
		managed.setDob(volunteer.getDob());
		System.out.println("08");
		managed.setAbout(volunteer.getAbout());
		System.out.println("09");
		managed.addProject(project);
		return managed;
	}
	
	 

}
