#!/bin/bash

while getopts ":sa:" opcao
do
	case $opcao in
		s) echo "Ok, opção simples(-s)";;
		a) echo "OK, opção com argumento (-a), recebeu: $OPTARG";;
		\?) echo "Erro, opção inválida: $OPTARG";;
		:) echo "Erro, faltou argumento para: $OPTARG";;
	esac
done

echo
shift $((OPTIND - 1))
echo "INDICE: $OPTIND"
echo "RESTO: $*"
echo
