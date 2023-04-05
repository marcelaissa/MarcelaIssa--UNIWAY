extends Node

#Variáveis utilizadas para armazenar e tranferir valores entre cenas.

var verificadorDePause :bool

var pontosArmazenados :float

var posicionamentoDoJogador

var validadorDoTutorial :bool = true

#Se essa variável for igual a 0 o idioma é PT-BR
#Se essa variável for igual a 1 o idioma é Inglês
#Se essa variável for igual a 2 o idioma é espanhol
var idiomaEscolhido :float = 0

#Vida do caminhão começa em 4
var vidaDoCaminhao :float

var nomeDoJogador :String

var verificadorGarantirPontos :bool

var personagemSelecionado :int

#se = 0 morreu para o carro da via contraria, se = 1 morreu para o buraco
var comoPerdeu:int

#se = true volume está ativo, se = false volume está no mudo
var volume :bool = true
