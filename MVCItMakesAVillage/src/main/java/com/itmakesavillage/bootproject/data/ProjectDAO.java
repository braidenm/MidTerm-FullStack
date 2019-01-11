package com.itmakesavillage.bootproject.data;

import java.util.List;
import java.util.Set;

import com.itmakesavillage.jpaproject.entities.Category;
import com.itmakesavillage.jpaproject.entities.Project;

public interface ProjectDAO {
	
	public Project findProject(int id);
	public Project createProject(Project project);
	public Project updateProject(int id, Project project);
	public Set<Project> searchProject(String keyword);
	public List<Project> getAllProject();
	public List<Category> getAllCategories();


}
