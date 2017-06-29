package me.starpy.sdk;

public interface StarpySDK {

    public interface Listener {

        public void requestLogin( java.lang.String phone );

        public void confirmLogin( java.lang.String code );

    }

    public interface Responder {

        public void requestedLogin( java.lang.String result );

        public void confirmedLogin( java.lang.String result );

    }

}
