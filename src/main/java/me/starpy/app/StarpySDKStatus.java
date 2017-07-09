package me.starpy.app;

public class StarpySDKStatus 
{
	public final String statusText;
	
	public final Int 	statusCode;

	public final String error;

	public StarpySDKStatus(String json) 
	{

		JSONObject data = new JSONObject(json);

		statusCode 	= data.getInt("statusCode");
		statusText 	= data.getString("statusText");
		error 		= data.getString("error");
	}
}