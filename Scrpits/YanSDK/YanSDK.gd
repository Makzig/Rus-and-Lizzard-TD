extends Node


var callback_rewarded_ad = JavaScript.create_callback(self, '_rewarded_ad')
var callback_ad = JavaScript.create_callback(self, '_ad')

onready var win = JavaScript.get_interface("window")

signal ad_started
signal ad_finished


func _ready() -> void:
	if OS.has_feature("YandexGames"):
		win.initGame(win)
	elif !OS.has_feature("YandexGames"):
		print("Not a HTML5")

func js_show_ad():
	if OS.has_feature("YandexGames"):
		win.ShowAd(callback_ad)
		emit_signal("ad_started")


func js_show_rewarded_ad():
	if OS.has_feature("YandexGames"):
		win.ShowAdRewardedVideo(callback_rewarded_ad)


func _rewarded_ad(args):
	if OS.has_feature("YandexGames"):
		print(args[0])


func _ad(args):
	if OS.has_feature("YandexGames"):
		print(args[0])
