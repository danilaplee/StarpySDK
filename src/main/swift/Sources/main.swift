
import java_swift
@_exported import Foundation

let stSDK = StarpySDKMain()

var responder: StarpySDK_ResponderForward!

class ListenerImpl: StarpySDK_ListenerBase {

    override func requestLogin(phone:String) {
        stSDK.RequestLogin(phone, done:{ response in
            responder.requestedLogin(response)
        })
    }

    override func confirmLogin(code:String) {
        stSDK.ConfirmLogin(code, done: { response in
            responder.confirmedLogin(response)
        })
    }
}   

@_silgen_name("Java_me_starpy_sdk_StarpySDK_bind")
public func bind( __env: UnsafeMutablePointer<JNIEnv?>, __this: jobject?, __self: jobject? )-> jobject? {
    responder = StarpySDK_ResponderForward( javaObject: __self )
    return ListenerImpl().javaObject
}
