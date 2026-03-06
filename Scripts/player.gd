extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var tilemap = $"../TileMapLayer"

var tiles_to_highlight = []
func _draw():
	var tile_size = Vector2(tilemap.tile_set.tile_size)
	for tile in tiles_to_highlight:
		var tile_center = tilemap.map_to_local(tile)
		var global_pos = tilemap.to_global(tile_center)
		var local_pos = to_local(global_pos)
		var rect = Rect2(local_pos - tile_size/2, tile_size)
		draw_rect(rect, Color.YELLOW, false, 2)
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var player_tile = tilemap.local_to_map(global_position)
	var left_tile = player_tile + Vector2i(-1, 0)
	var right_tile = player_tile + Vector2i(1, 0)
	var bottom_tile = player_tile + Vector2i(0, 1)
	tiles_to_highlight = [left_tile, right_tile, bottom_tile]
	queue_redraw()
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	

	move_and_slide()
