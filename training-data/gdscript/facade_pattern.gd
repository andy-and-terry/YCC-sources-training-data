extends Node

class AudioSystem:
	func play(track: String) -> void:
		print("playing audio: %s" % track)

class VideoSystem:
	func load_video(name: String) -> void:
		print("loading video: %s" % name)

class SubtitleSystem:
	func enable(lang: String) -> void:
		print("subtitles enabled: %s" % lang)

class MediaPlayerFacade:
	var audio := AudioSystem.new()
	var video := VideoSystem.new()
	var subtitles := SubtitleSystem.new()

	func play_movie(name: String, lang: String) -> void:
		video.load_video(name)
		audio.play(name)
		subtitles.enable(lang)

func _ready():
	var player := MediaPlayerFacade.new()
	player.play_movie("adventure.mp4", "en")
