package com.itmakesavillage.bootproject.data;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.itmakesavillage.jpaproject.entities.Address;
import com.itmakesavillage.jpaproject.entities.Category;
import com.itmakesavillage.jpaproject.entities.Comments;
import com.itmakesavillage.jpaproject.entities.Project;
import com.itmakesavillage.jpaproject.entities.State;
import com.itmakesavillage.jpaproject.entities.User;

@Service
@Transactional
public class ProjectDAOImpl implements ProjectDAO {
	
	@PersistenceContext
	private EntityManager em;


	@Override
	public Project findProject(int id) {

		return em.find(Project.class, id);
	}

	@Override
	public Project createProject(Project project) {
		em.persist(project);
		
		return project;
	}

	@Override
	public Project updateProject(int id, Project project) {
		Project managed = em.find(Project.class, id);
		
		managed.setEndDate(project.getEndDate());
		managed.setStartDate(project.getStartDate());
		managed.setTime(project.getTime());
		managed.setTitle(project.getTitle());
		managed.setVolunteersNeeded(project.getVolunteersNeeded());
		managed.setHoursNeeded(project.getHoursNeeded());
		managed.setDescription(project.getDescription());
		managed.setAddress(project.getAddress());
		managed.setCategories(project.getCategories());
		managed.setActive(project.isActive());

		return managed;
	}

	@Override
	public Set<Project> searchProject(String keyword) {
		
		keyword = "%"+keyword+"%";
		keyword = keyword.replaceAll(" ", "% %");
		String wordsarr[] = keyword.split(" ");
		Set<Project> projectSet = new HashSet<>();
		
		for (String searchword : wordsarr) {
			String query = "select p from Project p JOIN FETCH p.categories c where title like:search or c.name like:search";
			projectSet.addAll(em.createQuery(query, Project.class ).setParameter
					("search", searchword).getResultList());
		}
		return projectSet;
	}

	@Override
	public List<Project> getAllProject() {
		String query = "select p from Project p";
		
		return em.createQuery(query, Project.class).getResultList();
	}
	
	@Override
	public List<Category> getAllCategories() {
		
		String query = "select c from Category c";
		
		return em.createQuery(query, Category.class).getResultList();
		
	}
	
	@Override
	public Category findCategoryById(int id) {

		return em.find(Category.class, id);
	}

	@Override
	public List<State> getAllStates() {
		
		String query = "select s from State s";
		
		return em.createQuery(query, State.class).getResultList();
		
	}
	@Override
	public State getStateById(int stateId) {
		
		return em.find(State.class, stateId);
		
	}
	@Override
	public Address updateAddress(Address address) {
		Address managed = em.find(Address.class, address.getId());
		
		managed.setStreet(address.getStreet());
		managed.setCity(address.getCity());
		managed.setState(address.getState());
		managed.setZip(address.getZip());
		
		
		
		return managed;
		
	}
	@Override
	public Address createAddress(Address address) {
		
		em.persist(address);
		
		return address;
		
	}

	@Override
	public Comments deactivateComment(Comments comment) {
		comment = em.find(Comments.class, comment.getId());
		comment.setActive(false);
		return comment;
	}

	@Override
	public Comments createComment(Comments comment) {
		Project managedProject = em.find(Project.class, comment.getProject().getId());
		User managedUser = em.find(User.class, comment.getUser().getId());
		em.persist(comment);
			managedProject.addComment(comment);
			managedUser.addComment(comment);
		return comment;
	}

	@Override
	public Comments reactivateComment(Comments comment) {
		comment = em.find(Comments.class, comment.getId());
		comment.setActive(true);
		return comment;
	}

	

}
