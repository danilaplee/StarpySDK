import Foundation;
import Dispatch;

class StarpySDK {
	
    let queue = DispatchQueue.global()

	public typealias CompletionHandler = (_ status: String) -> Void

	public func RequestLogin(phone:String, done:@escaping CompletionHandler) {
        	queue.async() {
			// ...
			done("success")
		}

	}

	public func ConfirmLogin(code:String, done:@escaping CompletionHandler) {
        	queue.async() {
			// ...
			done("success")
		}
	}
}
