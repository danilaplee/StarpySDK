import Foundation

public class StarpySDKStatus {
	
	var statusText:String?

	var statusCode:Int?

	var error:String?

	init(_ params:[String:Any]) 
	{	
		if(params["status"] != nil) { statusText 	= params["status"] 	as! String }

		if(params["code"] 	!= nil) { statusCode 	= params["code"] 	as! Int }

		if(params["error"] 	!= nil) { error 		= params["error"] 	as! String }
	}

	func toJSONString() -> String
	{
		let j = [

			"statusText":self.statusText,
			"statusCode":self.statusCode,
			"error":self.error

		] as [String:Any]

        do {
            let json = try JSONSerialization.data(withJSONObject: j, options: .init(rawValue: 0))
            return String(data: json, encoding: .utf8)!

        } catch(let error) {
            return "{\"error\":{\"message\":"+error.localizedDescription+"}}"
        }
	}
}