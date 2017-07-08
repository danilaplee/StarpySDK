import Foundation;
import Dispatch;

class StarpySDKMain {
	
    let queue = DispatchQueue.global()

	public typealias CompletionHandler = (_ status: String) -> Void

	public func RequestLogin(_ phone:String, done:@escaping CompletionHandler) {
        queue.async() {
        	
			done("success")
		}

	}

	public func ConfirmLogin(_ code:String, done:@escaping CompletionHandler) {
        queue.async() {

			done("success")
		}
	}
}
