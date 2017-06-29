
import java_swift
@_exported import Foundation

let stSDK = StarpySDK()

var responder: StarpySDK_ResponderForward!

class ListenerImpl: StarpySDK_ListenerBase {

    typealias CompletionHandler = (_ status: StarpySDKStatus) -> Void

    override func RequestLogin(phone:String) {
        stSDK.RequestLogin(phone, done:{ response in
            responder.RequestedLogin(response)
        })
    }

    override func ConfirmLogin(code:String) {
        stSDK.ConfirmLogin(code, done: { response in
            responder.ConfirmedLogin(response)
        })
    }
}   

@_silgen_name("Java_me_starpy_sdk_StarpySDK_bind")
public func bind( __env: UnsafeMutablePointer<JNIEnv?>, __this: jobject?, __self: jobject? )-> jobject? {
    responder = StarpySDK_ResponderForward( javaObject: __self )
    return ListenerImpl().javaObject
}