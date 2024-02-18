package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class City {
	private Integer cityId;
	private String city;
	private State state;
	
	public City() {
		super();
	}

	public City(Integer cityId) {
		this.cityId = cityId;
	}

	public City(Integer cityId, String city, State state) {
		this.cityId = cityId;
		this.city = city;
		this.state = state;
	}

	public static ArrayList<City> collectAllCities() {
		ArrayList<City> cities = new ArrayList<City>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");
		
			String query = "select city_id, city, c.state_id, state from cities as c inner join states as s where c.state_id=s.state_id";
			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				cities.add(new City(rs.getInt(1), rs.getString(2), new State(rs.getInt(3), rs.getString(4))));
			}

			con.close();
		} catch(SQLException|ClassNotFoundException e) {
			e.printStackTrace();
		}

		return cities;
	}
	
	public Integer getCityId() {
		return cityId;
	}
	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public State getState() {
		return state;
	}
	public void setState(State state) {
		this.state = state;
	}
}