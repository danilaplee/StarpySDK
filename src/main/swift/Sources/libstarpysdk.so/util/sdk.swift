import Foundation;
import Dispatch;

public class StarpySDKMain {

	//PUBLIC COMPLETION HANDLER WITH StarpySDKStatus RESPONSE
	public typealias CompletionHandler = (_ status: StarpySDKStatus) -> Void

	//APP CONSTANTS
    let queue = DispatchQueue.global()
    let config:sdkConfig

    //APP SERVICES
    var cli:cliTool?
    var http:httpService?
    var db:dbService?

	init(_ env:StarpySDKEnv?) {

		config 	= sdkConfig(env)
		cli 	= cliTool(self)
		http 	= httpService(self)
		db 		= dbService(self)
		
	}

	public func staticMode() {

		return cli!.staticMode();
	}

	public func RequestLogin(_ phone:String, done:@escaping CompletionHandler) {
        queue.async() {
        	let _status = StarpySDKStatus(self.http!._default)
			done(_status)
		}

	}

	public func ConfirmLogin(_ code:String, done:@escaping CompletionHandler) {
        queue.async() {
        	let _status = StarpySDKStatus(self.http!._default)
			done(_status)
		}
	}
}
