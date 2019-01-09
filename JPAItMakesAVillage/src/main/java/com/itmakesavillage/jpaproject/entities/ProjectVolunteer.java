package com.itmakesavillage.jpaproject.entities;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;


	
	@Entity
	@Table(name = "project_volunteer")
	public class ProjectVolunteer {

	    @EmbeddedId
	    private ProjectVolunteerId id;

	    @Column(name = "hours_pledged")
	    private int hoursPledged;
	   
	    @Column(name="hours_actual")
	    private int hoursActual;

		public ProjectVolunteerId getId() {
			return id;
		}

		public void setId(ProjectVolunteerId id) {
			this.id = id;
		}

		public int getHoursPledged() {
			return hoursPledged;
		}

		public void setHoursPledged(int hoursPledged) {
			this.hoursPledged = hoursPledged;
		}

		public int getHoursActual() {
			return hoursActual;
		}

		public void setHoursActual(int hoursActual) {
			this.hoursActual = hoursActual;
		}

		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + hoursActual;
			result = prime * result + hoursPledged;
			result = prime * result + ((id == null) ? 0 : id.hashCode());
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
			ProjectVolunteer other = (ProjectVolunteer) obj;
			if (hoursActual != other.hoursActual)
				return false;
			if (hoursPledged != other.hoursPledged)
				return false;
			if (id == null) {
				if (other.id != null)
					return false;
			} else if (!id.equals(other.id))
				return false;
			return true;
		}

		@Override
		public String toString() {
			return "ProjectVolunteer [id=" + id + ", hoursPledged=" + hoursPledged + ", hoursActual=" + hoursActual
					+ "]";
		}

		public ProjectVolunteer(ProjectVolunteerId id, int hoursPledged, int hoursActual) {
			super();
			this.id = id;
			this.hoursPledged = hoursPledged;
			this.hoursActual = hoursActual;
		}

		public ProjectVolunteer() {
			super();
		}
	    
	    
	}


