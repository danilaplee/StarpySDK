package org.genie.me_starpy_sdk;

public class StarpySDK_ListenerProxy implements me.starpy.sdk.StarpySDK.Listener {

    long swiftObject;

    StarpySDK_ListenerProxy( long swiftObject ) {
        this.swiftObject = swiftObject;
    }


    public native void __RequestLogin( java.lang.String phone );

    public void RequestLogin( java.lang.String phone)  {
        __RequestLogin(phone);
    }


    public native void __ConfirmLogin( java.lang.String code );

    public void ConfirmLogin( java.lang.String code)  {
        __ConfirmLogin(code);
    }
}
