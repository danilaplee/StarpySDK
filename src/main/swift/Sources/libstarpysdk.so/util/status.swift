import Foundation

public class StarpySDKStatus {
	
	var statusText:String?

	var statusCode:Int?

	var error:String?

	init(_ params:[String:Any]) 
	{	
		let _result = params["response"] as! [String:Any]

		if(_result["status"] != nil) { statusText 	= _result["status"] 	as! String }

		if(_result["code"] 	!= nil) { statusCode 	= _result["code"] 	as! Int }

		if(_result["error"] != nil) { error 		= _result["error"] 	as! String }
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