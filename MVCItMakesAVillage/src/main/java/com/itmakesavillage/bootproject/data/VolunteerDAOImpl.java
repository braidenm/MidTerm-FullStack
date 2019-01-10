package com.itmakesavillage.bootproject.data;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
		em.persist(volunteer);
		return volunteer;
	}

	@Override
	public Volunteer updateVolunteer(int id, Volunteer volunteer) {
		Volunteer managed = em.find(Volunteer.class, id);
		managed = volunteer;
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

}
