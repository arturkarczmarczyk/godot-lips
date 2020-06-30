extends Control


var prompt = ["imię męskie", "przymiotnik", "rzeczownik"]
var story = "Dawno dawno temu, w lesie mieszkał %s. Byl to %s %s."
var player_words = []

onready var PlayerInput = $Rows/Cols/PlayerInput
onready var TextDisplay = $Rows/TextDisplay

func _ready():
	run()
	

func is_story_done():
	return player_words.size() == prompt.size()
	
func add_to_player_words():
	player_words.append(PlayerInput.text)
	PlayerInput.clear()
	run()
	
func tell_story():
	TextDisplay.text = story % player_words
	
func run():
	if is_story_done():
		tell_story()
	else:
		prompt_player()

func prompt_player():
	TextDisplay.text = "Proszę podaj " + prompt[player_words.size()]


func _on_PlayerInput_text_entered(new_text):
	add_to_player_words()


func _on_OkButton_pressed():
	add_to_player_words()
