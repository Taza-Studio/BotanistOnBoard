extends MeshInstance3D

@onready var ZoomPos = $CameraPos
@onready var ZoomCamera = $Magnifier/ZoomCamera

func _process(delta):
	ZoomCamera.global_transform = ZoomPos.global_transform
