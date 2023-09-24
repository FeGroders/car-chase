extends Area3D

var coins := 1

func _ready():
	$anim.play("default")

func _on_body_entered(_body):
	$anim.play("collect")	
	await $CollisionShape3D.call_deferred("queue_free")
	Globals.coins += coins
	print(Globals.coins)

func _on_anim_animation_finished(anim_name):
	if anim_name == "collect":
		queue_free()
