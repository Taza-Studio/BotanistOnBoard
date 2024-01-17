extends Control

func _on_quit_button_pressed():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()

func _on_menu_button_pressed():
	pass # TODO: Go to main menu

func _on_unpause_button_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	self.hide()
	self.set_process(false)

func _on_options_button_pressed():
	pass # TODO: Go to options menu
