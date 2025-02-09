namespace RD.Meraki;

public static class CurrentClient
{
	// This property is used to store the current client instance, so that it is accessible across runspaces
	public static ApiClient? ApiClient;
}

public partial class ApiClient
{


	private string authToken;
	public string AuthToken
	{
		set => authToken = value;
	}

	/// <summary>
	/// This is an extensibility point that lets us hook into the request as it goes out. This is where we add the auth token info.
	/// </summary>
	partial void PrepareRequest(HttpClient client, HttpRequestMessage request, string url)
	{
		// Append the auth token to the request
		request.Headers.Add("Authorization", "Bearer " + authToken);
	}
}