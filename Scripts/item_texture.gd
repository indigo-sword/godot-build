extends TextureRect

@export var this_scene : PackedScene

@onready var object_cursor = get_node("/root/LevelEditor/Editor_Object")
@onready var cursor_sprite = object_cursor.get_node("Sprite")


# Called when the node enters the scene tree for the first time.
func _ready():
	self.gui_input.connect(self._item_clicked)
	object_cursor.can_place = true
	pass # Replace with function body.

func _item_clicked(event):
	#if (event is InputEvent):
		#if (event.is_action_pressed("ui_left")):
			#object_cursor.current_item = this_scene
			#cursor_sprite.texture = texture
	if (event is InputEvent):
		if(event.is_action_released("ui_left")):
			print("Mouse entered")
			object_cursor.current_item = this_scene
			cursor_sprite.texture = texture
			#object_cursor.can_place = true
		#elif(event.is_action_released("ui_right")):
			#print("Mouse released")
			#object_cursor.can_place = false
			#object_cursor.current_item = null
			#cursor_sprite.texture = null
	pass


