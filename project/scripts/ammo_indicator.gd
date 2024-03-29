extends Panel

@export var max_ammo := 40:
    set(value):
        max_ammo = value
        update_max_ammo_label()

@onready var _max_ammo_label := $HBoxContainer/MaxAmmo
@onready var _ammo_label := $HBoxContainer/Ammo
@onready var aps_indicator: ColorRect = $ApsIndicator


func _ready() -> void:
    Robot.ammo_changed.connect(update_label)
    _max_ammo_label.text = "%02d" % max_ammo
    update_label()
    update_max_ammo_label()

func update_max_ammo_label() -> void:
    if _max_ammo_label == null: return
    _max_ammo_label.text = "%02d" % max_ammo

func update_label() -> void:
    _ammo_label.text = "%02d" % Robot.get_ammo()

func _process(_delta) -> void:
    if Input.is_action_just_pressed("fire"):
        Robot.set_fire_command(true)
    
    if Input.is_action_just_released("fire"):
        Robot.set_fire_command(false)
