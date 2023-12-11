extends Button

signal updateScore(value : int)

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("button_down", on_button_down)
	pass # Replace with function body.

func on_button_down():
	updateScore.emit(1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
