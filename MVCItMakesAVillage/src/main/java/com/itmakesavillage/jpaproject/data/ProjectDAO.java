package com.itmakesavillage.jpaproject.data;

import java.util.List;
import java.util.Set;

import com.itmakesavillage.jpaproject.entities.Project;

public interface ProjectDAO {
	
	public Project findProject(int id);
	public Project createProject(Project project);
	public Project updateProject(int id, Project project);
	public Set<Project> searchProject(String Keyword);
	public List<Project> getAllProject();

}
