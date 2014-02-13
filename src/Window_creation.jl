#Window creation
#http://rosettacode.org/wiki/Window_creation

using Tk

# Create a window
window = Toplevel("Hello World", 200, 200, false)
pack_stop_propagate(window)

# Create a frame and pack it
fr = Frame(window)
pack(fr, expand=true, fill="both")

# Make the window visible
set_visible(window, true)

sleep(7)