#!/bin/bash

ordenar=0
inverter=0
maiusculas=0
delim='/t'

MENSAGEM_USO="
Uso: $(basename "$0") [-h | -V | -u | -s | -r)


	-h, help
	-V, version
	-u, uppercase
	-s, sort
	-r, reverse

	Use com prudência!
"

#Tratamento das opções de linha de comando
while test -n "$1"
do
	case "$1" in

	-d | --delimiter)
		shift
		delim="$1"

		if test -z "$delim"
		then
			echo "Faltou o argumento para a -d"
			exit 1
		fi


;;

	-u | --uppercase)
		maiusculas=1

;;


	-r | --reverse)
		inverter=1
;;

	-s | --sort)
		ordenar=1

;;
	-h | --help)
		echo "$MENSAGEM_USO"
		exit 0
;;

	-V | --version)
		echo $(basename "$0") Versão 0.3
		exit 0
;;

	*)	echo Opção inválida: $1
		exit 1

;;




esac


#Opção 1 já foi processada, a fila deve andar

shift

done


# Extrai a linguagem

lista=$(cut -d : -f 1,5 /etc/passwd)

# Ordena a listagem

if test "$ordenar" = 1
then
	lista=$(echo "$lista" | sort)
fi

#Inverte a mensagem

if test "$inverter" = 1
then
	lista=$(echo "$lista" | tac)
fi

#Converte para maiusculas

if test "$maiusculas" = 1
then
	lista=$(echo "$lista" | tr a-z A-Z)
fi

#Mostra o resultado para o usuário

echo "$lista" | tr : "$delim"




# Meu primeiro programa Shell Script, fonte: Shell Script, profissional. Aurélio Marinho Jargas