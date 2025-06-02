package mil.eugene.gamedev;

import org.libsdl.app.SDLActivity;

public class GameDevSimulator extends SDLActivity {
    @Override
    protected String[] getLibraries() {
        return new String[]{
                "native_lib"
        };
    }
}
