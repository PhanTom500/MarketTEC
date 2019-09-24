package rest_fb;

import java.util.Arrays;

import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;
import com.restfb.Version;
import com.restfb.json.JsonObject;
import com.restfb.types.User;

public class Get_User_Details {
	
	/*
	public User_Profile Get_Profile_info(String accesstoken) {
		
		User_Profile obj_User_Profile=new User_Profile();
		
		FacebookClient facebookClient = new DefaultFacebookClient(accesstoken, Version.VERSION_2_6);
			
		User user = facebookClient.fetchObject("me", User.class);
		 

		System.out.println("User name: " + user.getName());
		System.out.println("User email: " + user.getEmail());
		System.out.println("First Name: " + user.getFirstName());
		System.out.println("Last Name: " + user.getLastName());
		 
		obj_User_Profile.setUser_name(user.getName());
		obj_User_Profile.setEmail(user.getEmail());
		obj_User_Profile.setFirst_name(user.getFirstName());
		obj_User_Profile.setLast_name(user.getLastName());
		
		return obj_User_Profile;

	}
	*/
	
public User_Profile Get_Profile_info_v2(String accesstoken) {
		
		User_Profile obj_User_Profile=new User_Profile();
		
		try {
		
		
		FacebookClient facebookClient = new DefaultFacebookClient(accesstoken, Version.VERSION_2_6);
		
		JsonObject fetchObjectsResults =
				  facebookClient.fetchObjects(Arrays.asList("me", "123456789"), 
				           JsonObject.class, Parameter.with("fields","id,name,email"));

		System.out.println(fetchObjectsResults);
		
		String temp = fetchObjectsResults.toString();
		
		obj_User_Profile.setId(temp.substring(temp.indexOf("\"id\":\"")+6,temp.indexOf("\",\"name\":\"")));
		obj_User_Profile.setName(temp.substring(temp.indexOf("\",\"name\":\"")+10,temp.indexOf("\",\"email\":\"")));
		obj_User_Profile.setEmail(temp.substring(temp.indexOf("\",\"email\":\"")+11,temp.length()-3));
		
		
		} catch (Exception e) {
			System.out.println(e);
		}
		return obj_User_Profile;
		

	}

}
