package com.itmakesavillage.bootproject.data;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.itmakesavillage.jpaproject.entities.Project;

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
		
		managed = project;
		
		return managed;
	}

	@Override
	public Set<Project> searchProject(String keyword) {
		
		keyword = "%"+keyword+"%";
		keyword = keyword.replaceAll(" ", "% %");
		String wordsarr[] = keyword.split(" ");
		Set<Project> projectSet = new HashSet<>();
		
		for (String searchword : wordsarr) {
			String query = "select p from Project p where title like:search or category like:search";
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

}
