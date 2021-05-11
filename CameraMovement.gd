extends Camera

func _input(event):         
	if  Input.is_key_pressed(KEY_D):
		global_translate(Vector3(0.1,0,0))
	if  Input.is_key_pressed(KEY_A):
		global_translate(Vector3(-0.1,0,0))
	if  Input.is_key_pressed(KEY_F):
		rotate_y(deg2rad(5))
	if  Input.is_key_pressed(KEY_G):
		rotate_y(deg2rad(-5))
	if  Input.is_key_pressed(KEY_Z):
		rotate_x(deg2rad(2))
	if  Input.is_key_pressed(KEY_H):
		rotate_x(deg2rad(-2))
	if Input.is_key_pressed(KEY_W):
		global_translate(Vector3(0,0,-0.1))
	if Input.is_key_pressed(KEY_S):
		global_translate(Vector3(0,0,0.1))
