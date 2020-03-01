extends Node2D
const path = "res://Scenes/SubScenes/"
const sceneList = [
  "Original",
  "Jump",
  "HighJump",
  "ScaryJump",
  "ScaryJump2",
  "OriginalReversed",
  "MultiPole",
  "MultiCharacter",
  "MultiCharacterFlip",
  #"TartarugaPole",
  "WallPipe",
  "WallNoPipe",
  "WallNoPipeNoTurtle",
  "WallNoPipeNoTurtleAround",
  "Prison",
  "JustPipe",
  "NoFlag",
  "SuperPrison",
  "NoFlagNoCharacter",
  "SuperMarioClouds",
  "JustText",
  "ImagineTheFlagPole",
  "ImagineTheCharacter",
  "Imagine",
  "Sky",
  "Mut",
]

export var blablabla = 1
var currentScene = 0
var currentSceneRef

func LoadScene(num):
  if currentSceneRef:
    currentSceneRef.queue_free()
  var scenePath = path + sceneList[num] + ".tscn"
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