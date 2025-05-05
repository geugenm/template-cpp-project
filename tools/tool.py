import dearpygui.dearpygui as dpg


def shutdown():
    dpg.stop_dearpygui()
    dpg.destroy_context()


dpg.create_context()
dpg.create_viewport(title="Minimal Example", width=400, height=300)

with dpg.window(label="Main", tag="primary_window"):
    dpg.add_text("Hello, World!", tag="status_text")
    dpg.add_button(label="Exit", callback=shutdown)

dpg.set_primary_window("primary_window", True)
dpg.setup_dearpygui()
dpg.show_viewport()
dpg.start_dearpygui()
dpg.destroy_context()