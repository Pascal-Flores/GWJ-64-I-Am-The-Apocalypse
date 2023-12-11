extends Label

# signal updateScore(value : int)

const rampageCheckerTimeInterval : int = 5
const scoreMultipliers : Array[float] = [1.0, 1.25, 1.5, 2.0, 4.0, 8.0]
const baseNumberOfEnnemiesToKill : int = 5

var score : float
var scoreMultiplier : float

var rampageChecker : Timer
var killedEnnemiesSinceLastCheck : int

var ennemyGenerator : Node


func _ready():
	self.score = 0
	self.scoreMultiplier = scoreMultipliers[0]
	self.rampageChecker = $rampageChecker 
	self.rampageChecker.start(rampageCheckerTimeInterval)
	self.rampageChecker.connect("timeout", check_rampage)
	self.killedEnnemiesSinceLastCheck = 0
	get_node("/root/scoring/Button(Debug)").connect("updateScore", update_score)
#	self.ennemyGenerator = get_node("/root/scoring/ennemyGenerator")
#	self.ennemyGenerator.connect("ennemySpawned", on_ennemy_spawned)

func on_ennemy_spawned(ennemy) -> void:
#	ennemy.connect("updateScore", update_score)
	pass

func update_score(value : int) -> void:
	self.killedEnnemiesSinceLastCheck += 1
	score += value * scoreMultiplier
	self.text = str(roundi(score))


func check_rampage() -> void:
	var maintainRampageTreshold = roundi(baseNumberOfEnnemiesToKill * (1 + ((scoreMultipliers.find(scoreMultiplier) + 1) * 0.5)))
	print("maintain : " + str(maintainRampageTreshold))
	var upgradeRampageTreshold = roundi(baseNumberOfEnnemiesToKill * (1 + (scoreMultipliers.find(scoreMultiplier) + 2 ) * 0.5))
	print("upgrade : " + str(upgradeRampageTreshold))
	if killedEnnemiesSinceLastCheck >= upgradeRampageTreshold:
		self.scoreMultiplier = scoreMultipliers[scoreMultipliers.find(scoreMultiplier)+1]
	elif killedEnnemiesSinceLastCheck < maintainRampageTreshold:
		self.scoreMultiplier = scoreMultipliers[0]
	killedEnnemiesSinceLastCheck = 0
	print(self.scoreMultiplier)
