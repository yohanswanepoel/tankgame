extends KinematicBody2D

# Signal to update the UI
signal health_changed
signal dead

# export some things
export (PackedScene) var Bullet
export (int) var speed
export (float) var tank_rotation_speed
export (float) var gun_cool_down
export (int) var health

var velocity = Vector2()
var can_shoot = true
var alive = true

func _ready():
	$GunTimer.wait_time = gun_cool_down

# This is the control function for every frame
# In the player this is keyboard controls
# For AI this the logic	
func control(delta):
	pass
	
func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide(velocity)
