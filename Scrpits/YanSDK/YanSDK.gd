extends Node

var coins = 0
var callback_rewarded_ad = JavaScript.create_callback(self, '_rewarded_ad')
var callback_ad = JavaScript.create_callback(self, '_ad')

onready var win = JavaScript.get_interface("window")



#func _ready() -> void:
#	win.initGame(win)

func js_show_ad():
	win.ShowAd(callback_ad)


func js_show_rewarded_ad():
	win.ShowAdRewardedVideo(callback_rewarded_ad)


func _rewarded_ad(args):
	print(args[0])
	coins += 10

func _ad(args):
	print(args[0])
