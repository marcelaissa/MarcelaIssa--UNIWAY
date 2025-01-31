extends Control

#função que faz com que o efeito de luz inicie apagado ao entrar na cena
func _enter_tree():
	Global.personagemSelecionado = 4
	$caminhoneiro1/Light2D.visible = false
	$caminhoneiro2/Light2D.visible = false
	$Caminhoneira/Light2D.visible = false
	$Caminhoneira2/Light2D.visible = false
	$Light2D.visible = false
	Global.volume = true

#função que altera os textos de acordo com o idioma escolhido
func _process(delta):
	if Global.idiomaEscolhido == 0:
		$selecionarPersonagem.text = "Selecione um personagem"
	elif Global.idiomaEscolhido == 1:
		$selecionarPersonagem.text = "select a character"
	elif Global.idiomaEscolhido == 2:
		$selecionarPersonagem.text = "selecciona un personaje"
	volumeIcone()
	

#função que faz o efeito de luz aparecer 
func _on_Caminhoneiro1_mouse_entered():
	$caminhoneiro1/Light2D.visible = true

#função que faz o efeito de luz desaparecer
func _on_Caminhoneiro1_mouse_exited():
	$caminhoneiro1/Light2D.visible = false
	
#função que continua o jogo de acordo com o personagem escolhido
func _on_Caminhoneiro1_pressed():
	$ColorRect/AnimationPlayer.play("voltandoAoNormal")
	$Caminhoneira.visible = false
	$caminhoneiro1.visible = false
	$caminhoneiro2.visible = false
	$Caminhoneira2.visible = false
	$selecionarPersonagem.visible = false
	$caminhoneiro1Selecionado.visible = true
	$SecretariaSentada.visible = true
	Global.personagemSelecionado = 0
	yield(get_tree().create_timer(1), "timeout")
	alteradorDeIdioma()

#função que faz o efeito de luz aparecer 
func _on_caminhoneiro2_mouse_entered():
	$caminhoneiro2/Light2D.visible = true
	
#função que faz o efeito de luz desaparecer
func _on_caminhoneiro2_mouse_exited():
	$caminhoneiro2/Light2D.visible = false

#função que continua o jogo de acordo com o personagem escolhido
func _on_caminhoneiro2_pressed():
	$ColorRect/AnimationPlayer.play("voltandoAoNormal")
	$Caminhoneira.visible = false
	$caminhoneiro1.visible = false
	$caminhoneiro2.visible = false
	$Caminhoneira2.visible = false
	$selecionarPersonagem.visible = false
	$caminhoneiro2Selecionado.visible = true
	$SecretariaSentada.visible = true
	Global.personagemSelecionado = 1
	yield(get_tree().create_timer(1), "timeout")
	alteradorDeIdioma()
	
#função que faz o efeito de luz aparecer 
func _on_Caminhoneira_mouse_entered():
	$Caminhoneira/Light2D.visible = true

#função que faz o efeito de luz desaparecer
func _on_Caminhoneira_mouse_exited():
	$Caminhoneira/Light2D.visible = false

#função que continua o jogo de acordo com o personagem escolhido
func _on_Caminhoneira_pressed():
	$ColorRect/AnimationPlayer.play("voltandoAoNormal")
	$Caminhoneira.visible = false
	$caminhoneiro1.visible = false
	$caminhoneiro2.visible = false
	$Caminhoneira2.visible = false
	$selecionarPersonagem.visible = false
	$caminhoneiraSelecionada.visible = true
	$SecretariaSentada.visible = true
	Global.personagemSelecionado = 2
	yield(get_tree().create_timer(1), "timeout")
	alteradorDeIdioma()
	
#função que faz o efeito de luz aparecer 
func _on_Caminhoneira2_mouse_entered():
	$Caminhoneira2/Light2D.visible = true 

#função que faz o efeito de luz desaparecer
func _on_Caminhoneira2_mouse_exited():
	$Caminhoneira2/Light2D.visible = false
	
#função que continua o jogo de acordo com o personagem escolhido
func _on_Caminhoneira2_pressed():
	$ColorRect/AnimationPlayer.play("voltandoAoNormal")
	$Caminhoneira.visible = false
	$caminhoneiro1.visible = false
	$caminhoneiro2.visible = false
	$Caminhoneira2.visible = false
	$selecionarPersonagem.visible = false
	$Caminhoneira2Selecionado.visible = true
	$SecretariaSentada.visible = true
	Global.personagemSelecionado = 3
	yield(get_tree().create_timer(1), "timeout")
	alteradorDeIdioma()
	
#função que faz a mudança de idioma no dialogo com a secretaria de acordo
#com o idioma escolhido
func alteradorDeIdioma():
	if Global.idiomaEscolhido == 0:
		var dialogoPTBR = Dialogic.start("salaDaSecretaria")
		add_child(dialogoPTBR)
		
	
	if Global.idiomaEscolhido == 1:
		var dialogo1 = Dialogic.start("salaDaSecretaria1")
		add_child(dialogo1)
	
	if Global.idiomaEscolhido == 2:
		var dialogo2 = Dialogic.start("salaDaSecretaria2")
		add_child(dialogo2)

#Controla o volume do jogo, sendo ele mudo ou não
func _on_volumeAtivo_pressed():
	Sons.mudo()
	Global.volume = false

func _on_volumeMudo_pressed():
	Sons.audivel()
	Global.volume = true

#controla o icone do volume
func volumeIcone():
	if Global.volume:
		$volumeAtivo.rect_global_position.y = 28
		$volumeMudo.rect_global_position.y = 100000
	else:
		$volumeAtivo.rect_global_position.y = 100000
		$volumeMudo.rect_global_position.y = 18


#controlar a luz de fundo do volume
func _on_volumeAtivo_mouse_entered():
	if Global.personagemSelecionado == 4:
		$Light2D.visible = true


func _on_volumeAtivo_mouse_exited():
	if Global.personagemSelecionado == 4:
		$Light2D.visible = false


func _on_volumeMudo_mouse_entered():
	if Global.personagemSelecionado == 4:
		$Light2D.visible = true


func _on_volumeMudo_mouse_exited():
	if Global.personagemSelecionado == 4:
		$Light2D.visible = false
