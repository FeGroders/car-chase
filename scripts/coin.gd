extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$anim.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	$anim.play("collect")	

func _on_anim_animation_finished(anim_name):
	if anim_name == "collect":
		queue_free()
