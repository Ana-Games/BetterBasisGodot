extends Resource
class_name BetterBasis

static func set_up(original: Basis, new_up: Vector3) -> Basis:
	new_up = new_up.normalized()
	var original_y = original.y.normalized()
	
	if new_up == original_y: return original
	elif original_y == -new_up:
		return Basis(original.z, new_up * original.y.length(), original.x)
	else:
		var cross = original_y.cross(new_up).normalized()
		var angle = original_y.angle_to(new_up)
		if cross == Vector3.ZERO:
			print("error setting up basis - cross product is 0")
			return original
		return original.rotated(cross,angle)

static func set_right(original: Basis, new_right: Vector3) -> Basis:
	new_right = new_right.normalized()
	var original_x = original.x.normalized()
	
	if new_right == original_x: return original
	elif original_x == -new_right:
		return Basis(new_right * original.x.length(), original.z, original.y)
	else:
		var cross = original_x.cross(new_right).normalized()
		var angle = original_x.angle_to(new_right)
		if cross == Vector3.ZERO:
			print("error setting right basis - cross product is 0")
			return original
		return original.rotated(cross,angle)

static func set_forward(original: Basis, new_forward: Vector3) -> Basis:
	new_forward = new_forward.normalized()
	var original_z = original.z.normalized()
	
	if new_forward == original_z: return original
	elif original_z == -new_forward:
		return Basis(original.y,original.x, new_forward * original.z.length())
	else:
		var cross = original_z.cross(new_forward).normalized()
		var angle = original_z.angle_to(new_forward)
		if cross == Vector3.ZERO:
			print("error setting up basis - cross product is 0")
			return original
		return original.rotated(cross, angle)

static func get_up(basis : Basis) -> Vector3:
	return basis.y.normalized()

static func get_right(basis : Basis) -> Vector3:
	return basis.x.normalized()

static func get_forward(basis : Basis) -> Vector3:
	return basis.z.normalized()
