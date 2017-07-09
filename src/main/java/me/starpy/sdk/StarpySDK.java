package me.starpy.sdk;

public interface StarpySDK {

    public interface Listener {

        public void requestLogin( String phone );

        public void confirmLogin( String code );

    }

    public interface Responder {

        public void requestedLogin( String result );

        public void confirmedLogin( String result );

    }

}
