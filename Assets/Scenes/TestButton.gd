extends Button

signal update_score(value : int)

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("button_down", on_button_down)

func on_button_down():
	update_score.emit(RandomNumberGenerator.new().randi_range(1, 10))
