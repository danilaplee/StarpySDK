import Foundation;
import Dispatch;

class StarpySDKMain {
	
    let queue = DispatchQueue.global()
    let config:SDKConfig?
    let cli:cliTool?
    let http:HttpService?

	public typealias CompletionHandler = (_ status: SDKStatus) -> Void

	init(env:SDKEnvParams) {
		config 	= SDKConfig(env)
		cli 	= cliTool(self)
		http 	= HttpService(self)
	}

	public func RequestLogin(_ phone:String, done:@escaping CompletionHandler) {
        queue.async() {
        	
			done(SDKStatus(["status":"success","code":200]))
		}

	}

	public func ConfirmLogin(_ code:String, done:@escaping CompletionHandler) {
        queue.async() {

			done(SDKStatus(["status":"success","code":200]))
		}
	}
}
