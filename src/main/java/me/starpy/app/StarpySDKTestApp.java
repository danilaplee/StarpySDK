package me.starpy.app;

import android.app.Activity;
import android.os.Handler;
import android.os.Bundle;
import android.widget.TextView;

import me.starpy.sdk.StarpySDK.Listener;
import me.starpy.sdk.StarpySDK.Responder;

class StarpySDKTestApp extends Activity implements Responder {

    static Listener listener;
    Handler mainHandler;

    private static void loadNativeDependencies() {
        // Load libraries
        System.loadLibrary("libstarpysdk.so");
    }

    /** Called when the activity is first created. */
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        loadNativeDependencies();
        listener = bind( this );
    }
    @Override
    public void requestedLogin(String result) {

    }

    @Override
    public void confirmedLogin(String result) {

    }



    native Listener bind( Responder self );
}
