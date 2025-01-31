extends Control


var confirmaContinuar :bool
#Essas funções fazem com que apareça o certinho do checklist quando
#o seu respectivo botão for pressionado
func _on_Button1_pressed():
	$"Check(Checklist)1".visible = true
	$somChecklist.play()

func _on_Button2_pressed():
	$"Check(Checklist)2".visible = true
	$somChecklist.play()

func _on_Button3_pressed():
	$"Check(Checklist)3".visible = true
	$somChecklist.play()
	
func _on_Button4_pressed():
	$"Check(Checklist)4".visible = true
	$somChecklist.play()

#Essa função habilita o botão continuar se todos os checklist estiverem feitos
func _process(delta):
	#chama a função de alterar o idioma
	alteradorDeIdioma()
	if($"Check(Checklist)1".visible == true && $"Check(Checklist)2".visible == true && $"Check(Checklist)3".visible == true && $"Check(Checklist)4".visible == true):
		$continuar.disabled = false
	alteradorDePersonagem()
	volumeIcone()
	
#Essa função altera as palavras de acordo com o idioma escolhido 
func alteradorDeIdioma():
	if Global.idiomaEscolhido == 0:
		$Button1.text = "Arrumar Freios"
		$Button2.text = "Verificar  Motor"
		$Button3.text = "Alinhar eixos"
		$Button4.text = "Calibrar Pneus"
		$continuar.text = "Continuar"
	
	elif Global.idiomaEscolhido == 1:
		$Button1.text = "fix brakes"
		$Button2.text = "Check Engine"
		$Button3.text = "align axes"
		$Button4.text = "Calibrate Tires"
		$continuar.text = "Continue"
			
	
	elif Global.idiomaEscolhido == 2:
		$Button1.text = "arreglar frenos"
		$Button2.text = "Comprobar motor"
		$Button3.text = "alinear ejes"
		$Button4.text = "calibrar ruedas"
		$continuar.text = "Continuar"
	

#Função de troca de cena
func _on_continuar_pressed():
	$somContinuar.play()
	yield(get_tree().create_timer(1),"timeout")
	transitionScene.trocaDeCena()
	confirmaContinuar = true
	get_tree().change_scene("res://Cenas/Novo Nivel Principal.tscn")
	
func alteradorDePersonagem():
	match Global.personagemSelecionado:
		0:
			$caminhoneiro1Selecionado.visible = true
		1:
			$caminhoneiro2Selecionado.visible = true
		2:
			$caminhoneiraSelecionada.visible = true
		3: 
			$Caminhoneira2Selecionado.visible = true
	


func _on_volumeAtivo_pressed():
	Sons.mudo()
	Global.volume = false


func _on_volumeMudo_pressed():
	Sons.audivel()
	Global.volume = true
	
func volumeIcone() ->void:
	if Global.volume:
		$volumeAtivo.rect_global_position.y = 22
		$volumeMudo.rect_global_position.y = 100000
	else:
		$volumeAtivo.rect_global_position.y = 100000
		$volumeMudo.rect_global_position.y = 12
