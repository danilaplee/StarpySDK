@_exported import Foundation


#if os(Android) 

    import java_swift

    var responder: StarpySDK_ResponderForward!

    public class ListenerImpl: StarpySDK_ListenerBase {

        public let sdk = StarpySDKMain(nil)

        override func requestLogin(phone:String?) {
            sdk.RequestLogin(phone!, done:{ response in
                responder.requestedLogin(response.toJSONString())
            })
        }

        override func confirmLogin(code:String?) {
            sdk.ConfirmLogin(code!, done: { response in
                responder.confirmedLogin(response.toJSONString())
            })
        }
    }   

    @_silgen_name("Java_me_starpy_1app_StarpySDK_bind")
    public func bind( __env: UnsafeMutablePointer<JNIEnv?>, __this: jobject?, __self: jobject? )-> jobject? {
        responder = StarpySDK_ResponderForward( javaObject: __self )
        return ListenerImpl().javaObject
    }


    ListenerImpl.sdk.staticMode()

#else

    public let starpySDK = StarpySDKMain(nil)

    starpySDK.staticMode()

#endif
