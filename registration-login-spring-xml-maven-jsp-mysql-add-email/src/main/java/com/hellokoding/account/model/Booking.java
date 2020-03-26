package com.hellokoding.account.model;




import javax.persistence.*;


@Entity
@Table(name = "booking")
public class Booking {
	
	 	private Long id;
	    private String username;
	    private String source;
	    private String destination;
	    private String name;
	    private int fare;
	    
	    @Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getSource() {
			return source;
		}
		public void setSource(String source) {
			this.source = source;
		}
		public String getDestination() {
			return destination;
		}
		public void setDestination(String destination) {
			this.destination = destination;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}

public int getFare() {
	return fare;
}
public void setFare(int fare) {
	this.fare = fare;
}
		
		@Override
		public String toString() {
			return "Booking [id=" + id + ", username=" + username + ", source=" + source + ", destination="
					+ destination + ", name=" + name + ", fare=" + fare + "]";
		} 
	    

	    
	}



