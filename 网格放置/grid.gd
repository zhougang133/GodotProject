@tool
extends GridContainer
class_name Grid

@export var width := 5:
	set(value): 
		width = value
		_remove_grid()
		_create_grid()
@export var height := 5:
	set(value): 
		height = value
		_remove_grid()
		_create_grid()
@export var cellWidth := 100:
	set(value): 
		cellWidth = value
		_remove_grid()
		_create_grid()
@export var cellHeight := 100:
	set(value):
		cellHeight = value
		_remove_grid()
		_create_grid()
@export var borderSize := 5:
	set(value):
		borderSize = value
		_remove_grid()
		_create_grid()

const GRID_CELL = preload("uid://b2wdd0jpscgfs")

func _ready() -> void:
	_remove_grid()
	_create_grid()

func _create_grid():	
	columns = width
	for i in width * height:
		var gridCellNode = GRID_CELL.instantiate()
		gridCellNode.custom_minimum_size = Vector2(cellWidth, cellHeight)
		add_child(gridCellNode.duplicate())

func _remove_grid():
	for node in get_children():
		node.queue_free()
