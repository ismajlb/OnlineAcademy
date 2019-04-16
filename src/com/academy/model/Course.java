package com.academy.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class Course implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String courseName;
	private String facultyName;
	private String description;
	private String imageUrl;
	private int fees;
	private int userRating;
	private int ratings;
	
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getFacultyName() {
		return facultyName;
	}
	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public int getFees() {
		return fees;
	}
	public void setFees(int fees) {
		this.fees = fees;
	}
	public int getUserRating() {
		return userRating;
	}
	public void setUserRating(int userRating) {
		this.userRating = userRating;
	}
	public int getRatings() {
		return ratings;
	}
	public void setRatings(int ratings) {
		this.ratings = ratings;
	}
	
	public static List getCourses()
	{
		ArrayList courses;
		courses = new ArrayList();
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "");
			Statement stmt = con.createStatement();
			String qry = "Select * from course";
			ResultSet rs = stmt.executeQuery(qry);
			while(rs.next())
			{
				Course course = new Course();
				course.setCourseName(rs.getString("courseTitle"));
				course.setFacultyName(rs.getString("trainer"));
				course.setImageUrl(rs.getString("imageUrl"));
				course.setFees(rs.getInt("fees"));
				course.setDescription(rs.getString("courseDescription"));
				courses.addAll(courses);		
			}		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return courses;
	}
	

}
