import glfw
import OpenGL.GL as gl
import imgui
from imgui.integrations.glfw import GlfwRenderer


def main():
    if not glfw.init():
        return

    # Create standard window with decorations
    window = glfw.create_window(600, 400, "ImGui Control Panel", None, None)
    glfw.make_context_current(window)

    imgui.create_context()
    impl = GlfwRenderer(window)

    # Window state
    counter = 0
    input_text = ""
    bg_color = (1.0, 1.0, 1.0, 1.0)  # White background

    while not glfw.window_should_close(window):
        glfw.poll_events()
        impl.process_inputs()

        imgui.new_frame()

        # Full-screen ImGui window
        imgui.set_next_window_position(0, 0)
        imgui.set_next_window_size(*glfw.get_window_size(window))
        imgui.begin(
            "Main Interface",
            flags=imgui.WINDOW_NO_TITLE_BAR
            | imgui.WINDOW_NO_RESIZE
            | imgui.WINDOW_NO_MOVE
            | imgui.WINDOW_NO_BRING_TO_FRONT_ON_FOCUS,
        )

        # Control panel
        imgui.begin_child("Controls", 200, -40)
        imgui.text("Control Panel")
        imgui.separator()

        if imgui.button("Increment"):
            counter += 1
        imgui.same_line()
        if imgui.button("Decrement"):
            counter -= 1

        imgui.text(f"Counter: {counter}")
        imgui.separator()

        _, input_text = imgui.input_text("Input", input_text, 256)
        if imgui.button("Clear"):
            input_text = ""

        imgui.end_child()

        # Right panel
        imgui.same_line()
        imgui.begin_child("Content", 0, -40)
        imgui.text("Main Content Area")
        imgui.separator()
        imgui.text_wrapped(
            "This is the primary content section.\nAdd your components here."
        )
        imgui.end_child()

        # Bottom toolbar
        imgui.set_cursor_pos_y(imgui.get_window_height() - 30)
        if imgui.button("Exit", width=-1):
            glfw.set_window_should_close(window, True)

        imgui.end()

        # Rendering with visible background
        gl.glClearColor(*bg_color)
        gl.glClear(gl.GL_COLOR_BUFFER_BIT)
        imgui.render()
        impl.render(imgui.get_draw_data())
        glfw.swap_buffers(window)

    impl.shutdown()
    glfw.terminate()


if __name__ == "__main__":
    main()
