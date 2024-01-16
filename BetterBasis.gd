extends Resource
class_name BetterBasis

static func set_up(original: Basis, new_up: Vector3) -> Basis:
	new_up = new_up.normalized()
	var scale = Vector3(original.x.length(), original.y.length(), original.z.length())
	var old_basis = original.orthonormalized() as Basis
	
	if new_up == old_basis.y: return original
	
	var angle = old_basis.y.angle_to(new_up)
	var new_basis : Basis
	new_basis.y = new_up
	if old_basis.y == -new_up:
		new_basis.x = old_basis.z
		new_basis.z = old_basis.x
	else:
		var cross = old_basis.y.cross(new_up).normalized()
		if cross == Vector3.ZERO:
			print("error setting up basis - cross product is 0")
			return original
		new_basis.z = old_basis.z.rotated(cross, angle)
		new_basis.x = old_basis.x.rotated(cross, angle)
	
	new_basis = new_basis.orthonormalized()
	new_basis.x *= scale.x
	new_basis.y *= scale.y
	new_basis.z *= scale.z
	return new_basis

static func set_right(original: Basis, new_right: Vector3) -> Basis:
	new_right = new_right.normalized()
	var scale = Vector3(original.x.length(), original.y.length(), original.z.length())
	var old_basis = original.orthonormalized() as Basis
	
	if new_right == old_basis.x: return original
	
	var angle = old_basis.x.angle_to(new_right)
	var new_basis : Basis
	new_basis.x = new_right
	
	if old_basis.x == -new_right:
		new_basis.y = old_basis.z
		new_basis.z = old_basis.y
	else:
		var cross = new_right.cross(old_basis.x).normalized()
		if cross == Vector3.ZERO:
			print("error setting right basis - cross product is 0")
			return original
		new_basis.y = old_basis.y.rotated(cross, angle)
		new_basis.z = old_basis.z.rotated(cross, angle)
	
	new_basis = new_basis.orthonormalized()
	new_basis.x *= scale.x
	new_basis.y *= scale.y
	new_basis.z *= scale.z
	return new_basis

static func set_forward(original: Basis, new_forward: Vector3) -> Basis:
	new_forward = new_forward.normalized()
	var scale = Vector3(original.x.length(), original.y.length(), original.z.length())
	var old_basis = original.orthonormalized() as Basis
	
	if new_forward == old_basis.z: return original
	
	var angle = old_basis.z.angle_to(new_forward)
	var new_basis : Basis
	new_basis.z = new_forward
	if old_basis.z == -new_forward:
		new_basis.x = old_basis.y
		new_basis.y = old_basis.x
	else:
		var cross = old_basis.z.cross(new_forward).normalized()
		if cross == Vector3.ZERO:
			print("error setting up basis - cross product is 0")
			return original
		new_basis.y = old_basis.y.rotated(cross, angle)
		new_basis.x = old_basis.x.rotated(cross, angle)
	
	new_basis = new_basis.orthonormalized()
	new_basis.x *= scale.x
	new_basis.y *= scale.y
	new_basis.z *= scale.z
	return new_basis

static func get_up(basis : Basis) -> Vector3:
	return basis.y.normalized()

static func get_right(basis : Basis) -> Vector3:
	return basis.x.normalized()

static func get_forward(basis : Basis) -> Vector3:
	return basis.z.normalized()
