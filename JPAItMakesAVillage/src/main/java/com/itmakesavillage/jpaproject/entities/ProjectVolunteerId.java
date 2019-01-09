package com.itmakesavillage.jpaproject.entities;

import java.io.Serializable;

import javax.persistence.Column;

public class ProjectVolunteerId implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	@Column(name = "project_id")
    private Integer projectId;
    
    @Column(name = "volunteer_id")
    private Integer volunteerId;

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getVolunteerId() {
		return volunteerId;
	}

	public void setVolunteerId(Integer volunteerId) {
		this.volunteerId = volunteerId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((projectId == null) ? 0 : projectId.hashCode());
		result = prime * result + ((volunteerId == null) ? 0 : volunteerId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProjectVolunteerId other = (ProjectVolunteerId) obj;
		if (projectId == null) {
			if (other.projectId != null)
				return false;
		} else if (!projectId.equals(other.projectId))
			return false;
		if (volunteerId == null) {
			if (other.volunteerId != null)
				return false;
		} else if (!volunteerId.equals(other.volunteerId))
			return false;
		return true;
	}

	public ProjectVolunteerId(Integer projectId, Integer volunteerId) {
		super();
		this.projectId = projectId;
		this.volunteerId = volunteerId;
	}

	public ProjectVolunteerId() {
		super();
	}

	@Override
	public String toString() {
		return "ProjectVolunteerId [projectId=" + projectId + ", volunteerId=" + volunteerId + "]";
	}
    
    
}
