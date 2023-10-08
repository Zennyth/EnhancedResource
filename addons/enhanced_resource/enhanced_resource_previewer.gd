extends EditorResourcePreviewGenerator

func _can_generate_small_preview():
	return true

func _handles(type):
	return type == "Resource"

func _generate(resource: Resource, size: Vector2i, metadata: Dictionary):
	# The _get_icon method must return an [Image].
	# The resource script must be a @tool script.
	var icon: Texture

	if resource.has_method(&"_get_icon"):
		icon = resource.call(&"_get_icon")
	if &"icon" in resource:
		icon = resource.icon
	
	if icon == null:
		return null
	
	var img: Image = icon.get_image()
	img.resize(size.x, size.y, Image.INTERPOLATE_NEAREST)
	return ImageTexture.create_from_image(img)
