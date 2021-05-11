extends MeshInstance 

var array = ["", "res://house3.tscn", "res://cube.tscn"]
var index = 0
var money = 10000
var mode="build"
var istaken=0


func _input(event):         

	if  event.is_action_released("select_right"):
		global_translate(Vector3(4,0,0))
	if  event.is_action_released("select_left"):
		global_translate(Vector3(-4,0,0))
	if event.is_action_released("select_up"):
		global_translate(Vector3(0,0,-4))
	if event.is_action_released("select_down"):
		global_translate(Vector3(0,0,4))
	

		

	


func _on_Button2_pressed():
	visible = false
	get_tree().get_root().get_node("Spatial/Control/Panel").visible=false
	get_tree().get_root().get_node("Spatial/Control/Panel3").visible=false

func _ready():
	var timer = Timer.new()
	timer.set_wait_time(1.0)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "repeat_me")
	add_child(timer)
	timer.start()


func repeat_me():
	get_tree().get_root().get_node("Spatial/Control/Panel2/label").text=str(money)
func _on_Button_pressed():
	rotate_y(deg2rad(45))


func _on_build_pressed():
	visible = true
	mode="build"
	get_tree().get_root().get_node("Spatial/Control/Panel").visible=true
	get_tree().get_root().get_node("Spatial/Control/Panel3").visible=true
	get_tree().get_root().get_node("Spatial/Control/Panel4").visible=false
	get_surface_material(0).albedo_color=Color(0,1,0,0.5)


func _on_Button3_pressed():
	if mode=="build":
		if istaken==0:
			
			if money >=100:
				if index!=0:
					var scene = load(array[index])
					var building = scene.instance()
					building.transform.origin = transform.origin
					building.transform.origin.y = 0
					building.rotation = rotation
					get_tree().get_root().get_node("Spatial/container").add_child(building)
					money=money-100
					get_tree().get_root().get_node("Spatial/Control/Panel2/label").text=str(money)
				else:
					pass




func _on_test_pressed(extra_arg_0):
	index=1


func _on_test2_pressed():
	index=2

var okornot
var collisions := 0
var del
func _on_Area_area_entered(area):
	if mode=="build":
		collisions += 1
		if collisions > 0:
			get_surface_material(0).albedo_color=Color(1,0,0,0.5)
			istaken=1
	del = area.get_node("../../")

		

func _on_Area_area_exited(area):
	if mode=="build":
		collisions -= 1
		if collisions == 0:
			get_surface_material(0).albedo_color=Color(0,1,0,0.5)
			istaken=0
	del=null

		





func _on_no_pressed():
	get_tree().get_root().get_node("Spatial/Control/Panel4").visible=false
	visible=false

func _on_ok_pressed():
	if del!=null and money>=10:
		money=money-10
		get_tree().get_root().get_node("Spatial/Control/Panel2/label").text=str(money)
		del.queue_free()
		

func _on_delete_pressed():
	mode="delete"
	get_tree().get_root().get_node("Spatial/Control/Panel").visible=false
	get_tree().get_root().get_node("Spatial/Control/Panel3").visible=false
	get_tree().get_root().get_node("Spatial/Control/Panel4").visible=true
	istaken=0
	if collisions>0:
		collisions-=1
	get_surface_material(0).albedo_color=Color(1,1,0,0.5)
	rotation=Vector3(0,0,0)
	visible=true
	
