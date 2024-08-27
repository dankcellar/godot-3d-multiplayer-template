extends State

@export var _move_state : State
@export var _fall_state : State

const JUMP_VELOCITY := 6.5
const JUMP_MOVE_SPEED := 3.0

# NOTE: this may eventually go away in favor of using a single move/rotation function with lag compensation impl
func process_physics_client(delta: float):
	apply_player_rotation_client(delta)

func process_physics(delta: float) -> State:
	if parent.is_on_floor():
		parent.velocity.y = JUMP_VELOCITY * get_jump()
		
		var camera_basis = rotate_player_model(delta)
		move_player(delta, camera_basis, JUMP_MOVE_SPEED)
		
		return _fall_state
	return null
