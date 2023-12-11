extends Node

signal ennemySpawned(ennemy : Node)

var random : RandomNumberGenerator

func _ready():
	random = RandomNumberGenerator.new()
	random.randomize()
	$Timer.connect("timeout", on_timeout)
	$Timer.start(0.1)

func on_timeout():
	var ennemy = Node.new()
	self.add_child(ennemy)
	ennemySpawned.emit(ennemy)
	
	
