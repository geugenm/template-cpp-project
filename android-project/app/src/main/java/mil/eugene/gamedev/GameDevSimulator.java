package mil.eugene.gamedev;

import org.libsdl.app.SDLActivity;

public class GameDevSimulator extends SDLActivity {
    @Override
    protected String[] getLibraries() {
        return new String[]{
                "c++_shared",
                "SDL3",
                "native_lib"
        };
    }
}
