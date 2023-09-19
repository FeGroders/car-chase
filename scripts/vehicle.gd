extends VehicleBody3D
@onready var camera_mount = $camera_mount

var max_rpm = 50
var max_torque = 10

@export var sens_horizontal = 0.5
@export var sens_vertical = 0.5

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _input(event):
	if event is InputEventMouseMotion:
		camera_mount.rotate_y(deg_to_rad(event.relative.x*sens_horizontal))
		#camera_mount.rotate_x(deg_to_rad(event.relative.y*sens_vertical))

func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("right", "left") * 0.5, 5 * delta)
	var acceleration = Input.get_axis("backward", "forward") * 100
	var rpm = abs($rear_left_wheel.get_rpm())
	$rear_left_wheel.engine_force = acceleration * max_torque * (1 - rpm/max_rpm)
	rpm = abs($rear_right_wheel.get_rpm())
	$rear_right_wheel.engine_force = acceleration * max_torque * (1 - rpm/max_rpm)
