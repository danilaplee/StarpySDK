import Foundation;
import Dispatch;

class httpService {

    let sdk:StarpySDKMain;

    var isBearerEnabled = false;

    var authToken = ""

    let _default        = ["response":["status":"success","code":200]]

    func syncHttpCallWithMethod(url:String, params:[String:Any], request_method:String) -> [String:Any] 
    {
        var request = URLRequest(url: URL(string: url)!)
            request = self.addAuth(request);
            request.httpMethod = request_method
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")

        do {
            let jsonBody = try JSONSerialization.data(withJSONObject: params, options: .init(rawValue: 0))

            request.httpBody = jsonBody
            
            let session = URLSession.init(configuration: .background(withIdentifier: url))
                session.configuration.allowsCellularAccess = true

            let (data, response, error) = session.synchronousDataTask(with: request)
            
            if(error != nil) {
                return ["response":["error":["message":error!.localizedDescription]]]
            }

            var jsonResponse = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                jsonResponse["code"] = response!.statusCode;

            return ["response":jsonResponse];
        }
        catch(let error) {
            return ["response":["error":["message":error.localizedDescription]]]
        }
    }

    func get(_ url:String) -> [String:Any] {
        return self.syncHttpCallWithMethod(url:url, params:[:], request_method:"GET")
    }

    func put(_ url:String, params:[String:Any]) -> [String:Any] {
        return self.syncHttpCallWithMethod(url:url, params:params, request_method:"PUT")
    }

    func post(_ url:String, params:[String:Any]) -> [String:Any] {
        return self.syncHttpCallWithMethod(url:url, params:params, request_method:"POST")
    }

    func initBearerAuth(token:String) {
        isBearerEnabled = true;
        authToken = token;
    }

    func addAuth(_ request:URLRequest) -> URLRequest {

        var request = request

        if(isBearerEnabled) { request.addValue("Bearer "+self.authToken, forHTTPHeaderField: "Authorization") };

        return request;
    }

    init(_ instance:StarpySDKMain) {
        sdk = instance;
    }

}

extension URLSession {

    func synchronousDataTask(with request: URLRequest) -> (data: Data?, response: HTTPURLResponse?, error:Error?) {

        let semaphore = DispatchSemaphore(value: 0)

        var responseData: Data?
        var theResponse: URLResponse?
        var theError: Error?

        dataTask(with: request) { (data, response, error) -> Void in

            responseData = data
            theResponse = response
            theError = error

            semaphore.signal()

        }.resume()

        _ = semaphore.wait(timeout: .distantFuture)


        return (data: responseData, response: theResponse as! HTTPURLResponse?, error:theError)

    }
}
