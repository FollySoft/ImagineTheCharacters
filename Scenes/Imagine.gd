extends Node2D
const path = "res://Scenes/SubScenes/2Player/"
const sceneList = [
  "2P-Original",
  "2P-Climb",
  "2P-Koopas",
  "2P-Gap",  
  "2P-SkyFlag",
  "2P-SkyFlagCloudless",
  "2P-FlagRush",
  "2P-Blank",  
  "2P-BoxedIn",
  "2P-PlaygroundForMarioAndLuigi",
  "2P-ManyPipes",
  "2P-LuigisHouse",
  "2P-MariosHouse",
  "2P-TurtleLand",  
  "2P-TurtlesHouse",
  #"SuperPrison",
  #"NoFlagNoCharacter",
  #"SuperMarioClouds",
  #"JustText",
  #"ImagineTheFlagPole",
  #"ImagineTheCharacter",
  #"Imagine",
  #"Sky",
  "2P-ImagineFlag",
  "2P-Imagine",
]

export var blablabla = 1
var currentScene = 0
var currentSceneRef

func LoadScene(num):
	if currentSceneRef:
		currentSceneRef.queue_free()
	var scenePath = path + sceneList[num] + ".tscn"
	print(scenePath)
	var scene = load(scenePath).instance()
	add_child(scene)

func LoadNextScene():
  currentScene = (currentScene + 1) % len(sceneList)
  LoadScene(currentScene)

func LoadPrevScene():
  currentScene = max(currentScene - 1, 0)
  LoadScene(currentScene)
# Called when the node enters the scene tree for the first time.
func _ready():
  LoadScene(currentScene)
  pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass

func _unhandled_input(event):
#  if event is InputEventKey:
#    if event.pressed:
#      if event.scancode == KEY_ESCAPE:
#        get_tree().quit()
#      if event.scancode == KEY_LEFT or event.scancode == KEY_BACKSPACE:
#        LoadPrevScene()
#      elif event.pressed:
#        LoadNextScene()
	if event is InputEventMouseButton:
		if event.pressed:
			var uv = event.position / get_viewport_rect().size
			print(uv)
			if uv.x < 0.15 || event.button_index == BUTTON_RIGHT:
				LoadPrevScene()
			else:
				LoadNextScene()
