import dearpygui.dearpygui as dpg
import time


def log(event, **kwargs):
    print(f"{time.strftime('%Y-%m-%d %H:%M:%S')} [app] {event}: {kwargs}")


def shutdown():
    log("shutdown", status="initiated")
    dpg.stop_dearpygui()
    # Workaround: short delay to avoid segfault on some platforms
    time.sleep(0.1)
    log("shutdown", status="complete")


def main():
    log("startup", status="init")
    try:
        dpg.create_context()
        dpg.create_viewport(title="Modern Dear PyGui", width=400, height=300)

        with dpg.window(label="Main", tag="primary_window"):
            dpg.add_text("Modern, Robust Dear PyGui Example", tag="status_text")
            dpg.add_button(label="Exit", callback=shutdown)

        dpg.set_primary_window("primary_window", True)
        dpg.setup_dearpygui()
        dpg.show_viewport()
        log("startup", status="ready")
        dpg.start_dearpygui()
    except Exception as e:
        log("error", message=str(e), status="fatal")
        raise
    finally:
        shutdown()
        log("shutdown", status="cleanup")


if __name__ == "__main__":
    main()
