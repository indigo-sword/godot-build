extends TextureRect

@onready var object_cursor = get_node("/root/LevelEditor/Editor_Object")
@onready var cursor_sprite = object_cursor.get_node("Sprite")

var this_scene = PackedScene.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	self.gui_input.connect(self._item_input)
	object_cursor.can_place = true
	# Prepare object representation
	if (this_scene.pack(self) != OK):
		push_error("Error occured when packing the item.")
	pass # Replace with function body.

func _item_input(event):
	# Only operate on mouse pressed events
	if (event is InputEventMouseButton and event.pressed):
		# Only need to attach the item here.
		# The editor object will be responsible for removing the object once it is placed.
		object_cursor.current_item = this_scene
		cursor_sprite.texture = texture
		object_cursor.can_place = true
