package me.starpy.app;

import android.app.Activity;
import android.os.Handler;
import android.os.Bundle;

import me.starpy.sdk.StarpySDK.Listener;
import me.starpy.sdk.StarpySDK.Responder;

class StarpySDK extends Activity implements Responder {

    static Listener listener;
    Handler mainHandler;

    private static void loadNativeDependencies() {

        System.loadLibrary("starpysdk");

    }

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        loadNativeDependencies();
        listener = bind( this );
    }

    @Override
    public void requestedLogin(String result) {
        
        StarpySDKStatus status = new StarpySDKStatus(result);
    }

    @Override
    public void confirmedLogin(String result) {

        StarpySDKStatus status = new StarpySDKStatus(result);
    }

    native Listener bind( Responder self );
}
