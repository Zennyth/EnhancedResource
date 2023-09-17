@tool
extends EditorPlugin

###
# INITIALIZATION
###
func _enter_tree() -> void:
	initialize_settings()
	get_tree().node_added.connect(_on_node_added)

func _exit_tree() -> void:
	get_tree().node_added.disconnect(_on_node_added)


###
# SETTINGS
###
const SETTINGS_CATEGORY_PATH: String = "editor/resource"
const SETTINGS_NAME_PATH: String = SETTINGS_CATEGORY_PATH + "/name"
const SETTINGS_ICON_PATH: String = SETTINGS_CATEGORY_PATH + "/icon"

func initialize_settings() -> void:
	add_setting(SETTINGS_NAME_PATH, "name")
	add_setting(SETTINGS_ICON_PATH, "icon")

func add_setting(path: String, default: String) -> void:
	if ProjectSettings.has_setting(path): 
		return

	ProjectSettings.set_setting(path, default)
	var property_name_info := {
		"name": path,
		"type": TYPE_STRING,
	}
	ProjectSettings.add_property_info(property_name_info)
	ProjectSettings.set_initial_value(path, default)



###
# CORE
###
func _on_node_added(node: Node) -> void:
	if !(node is EditorProperty) or node.name.find("EditorPropertyResource") == -1:
		return
	
	node.ready.connect(initialize_editor_property.bind(node))

func initialize_editor_property(editor_property: EditorProperty) -> void:
	var resource_picker: EditorResourcePicker = editor_property.get_child(0)
	var button: Button = resource_picker.get_child(0)

	await get_tree().create_timer(.01).timeout

	if !is_instance_valid(button) or !is_instance_valid(resource_picker):
		return

	change_button(button, resource_picker)
	button.pressed.connect(change_button.bind(button, resource_picker))

func change_button(button: Button, resource_picker: EditorResourcePicker) -> void:
	if resource_picker == null or resource_picker.edited_resource == null:
		return
	
	var resource: Resource = resource_picker.edited_resource

	var name_key: String = ProjectSettings.get_setting(SETTINGS_NAME_PATH) 
	if name_key in resource and resource.get(name_key) != null and resource.get(name_key) != "":
		button.text = resource.get(name_key)
	
	var icon_key: String = ProjectSettings.get_setting(SETTINGS_ICON_PATH) 
	if icon_key in resource and resource.get(icon_key) != null:
		button.icon = resource.get(icon_key)