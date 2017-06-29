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
//         mainHandler = new Handler(StarpySDKTestApp.getContext().getMainLooper());
//         setContentView(R.layout.main);
        loadNativeDependencies();
        listener = bind( this );
    }
    @Override
    public void requestedLogin(String result) {
        // return status;
    }
    @Override
    public void confirmedLogin(String result) {
        // return status;
    }
    
//     @Override
//     public void confirmLogin(String code) {
//         // return status;
//     }
    
//     @Override
//     public void requestLogin(String phone) {
//         // return status;
//     }



    native Listener bind( Responder self );
}
