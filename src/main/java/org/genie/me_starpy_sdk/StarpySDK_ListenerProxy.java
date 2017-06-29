package org.genie.me_starpy_sdk;

public class StarpySDK_ListenerProxy implements me.starpy.sdk.StarpySDK.Listener {

    long swiftObject;

    StarpySDK_ListenerProxy( long swiftObject ) {
        this.swiftObject = swiftObject;
    }


    public native void __requestLogin( java.lang.String phone );

    public void requestLogin( java.lang.String phone)  {
        __requestLogin(phone);
    }


    public native void __confirmLogin( java.lang.String code );

    public void confirmLogin( java.lang.String code)  {
        __confirmLogin(code);
    }
}
