USE App_Nicklas;
DROP TABLE IF EXISTS Code_shutdown_app;
CREATE TABLE Code_shutdown_app (
code VARCHAR(255));
INSERT INTO Code_shutdown_app VALUES ('import tkinter as tk\r\nfrom tkinter import messagebox\r\nfrom tkinter import ttk\r\nimport os\r\nimport threading\r\nimport time\r\n\r\n# Globale Variable, um den Countdown-Status zu speichern\r\ncountdown_active = False\r\n\r\n# Funktion zum Herunterfahren des Computers\r\ndef herunterfahren_nach_zeit():\r\n    global countdown_active\r\n\r\n    t= messagebox.askyesno("Herunterfahren", "M�chtest du deinen Computer wirklich herunterfahren?")\r\n    \r\n    if t == True:\r\n        pass\r\n    else:\r\n        countdown_label.config(text="Countdown abgebrochen")\r\n        return\r\n\r\n    zeit_in_minuten = int(zeit_entry.get())\r\n    zeit_in_sekunden = zeit_in_minuten * 60\r\n\r\n    countdown_label.config(text=f"Herunterfahren in {zeit_in_minuten} Minuten")\r\n    \r\n    countdown_active = True\r\n    countdown_thread = threading.Thread(target=update_countdown, args=(zeit_in_sekunden,))\r\n    countdown_thread.start()\r\n\r\n    with open("shutdown.txt", "w") as f:\r\n        # f�g hinzu nach welcher Zeit der PC heruntergefahren werden soll\r\n        f.write(str(zeit_entry.get()))\r\n\r\n\r\ndef update_countdown(remaining_seconds):\r\n    global countdown_active\r\n    while remaining_seconds > 0 and countdown_active:\r\n        minutes = remaining_seconds // 60\r\n        seconds = remaining_seconds % 60\r\n        countdown_label.config(text=f"Herunterfahren in {minutes} Minuten {seconds} Sekunden")\r\n        remaining_seconds -= 1\r\n        time.sleep(1)\r\n   \r\n        \r\n\r\n    if countdown_active:\r\n        os.system("shutdown /s /t 1")\r\n        countdown_label.config(text="Heruntergefahren")\r\n    else:\r\n        countdown_label.config(text="Countdown abgebrochen")\r\n\r\n# Funktion zum Abbrechen des Countdowns\r\ndef countdown_abbrechen():\r\n    global countdown_active\r\n    countdown_active = False\r\n\r\n\r\n\r\n# GUI erstellen\r\nroot = tk.Tk()\r\nroot.title("PC Herunterfahren")\r\nroot.resizable(False, False)\r\n\r\nframe = ttk.Frame(root, padding=10)\r\nframe.grid(column=0, row=0, sticky=(tk.W, tk.E, tk.N, tk.S))\r\n\r\nlabel = ttk.Label(frame, text="Herunterfahren nach (Minuten):")\r\nlabel.grid(column=0, row=0)\r\n\r\nzeit_entry = ttk.Entry(frame)\r\nzeit_entry.grid(column=1, row=0)\r\n\r\nherunterfahren_button = ttk.Button(frame, text="Herunterfahren", command=herunterfahren_nach_zeit)\r\nherunterfahren_button.grid(column=0, row=1, columnspan=2)\r\n\r\ncountdown_label = ttk.Label(frame, text="")\r\ncountdown_label.grid(column=0, row=2, columnspan=2)\r\n\r\nabbrechen_button = ttk.Button(frame, text="Countdown abbrechen", command=countdown_abbrechen)\r\nabbrechen_button.grid(column=0, row=3, columnspan=2)\r\n\r\n\r\n\r\n\r\nroot.mainloop()');