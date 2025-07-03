# Linguagem PCD++

Este projeto é um compilador para a linguagem de programação pcdpp, desenvolvido com as ferramentas Flex e Bison. O compilador traduz o código-fonte em pcdpp para C++ e o executa.

Para compilar e executar este projeto, você precisará ter as seguintes ferramentas instaladas em seu sistema:

* `make`
* `flex`
* `bison`
* `g++` 

Em sistemas baseados em Debian/Ubuntu, você pode instalar todos os pré-requisitos com o seguinte comando:
```bash
sudo apt-get install make flex bison build-essential
```

O projeto utiliza um `Makefile` para automatizar todo o processo. Para compilar e executar um arquivo `.pcdpp`, utilize o comando `make run`.

O comando principal é:
```bash
make run FILE=<nome_do_aquivo>.pcdpp
```
O parâmetro `FILE` especifica qual arquivo de código-fonte pcdpp você deseja executar. Se nenhum arquivo for especificado, ele tentará executar `ex1_fatorial.pcdpp` por padrão.

Para rodar os arquivos desejados utilizamos o comando

## Exemplos

- No exemplo 1 devemos inserir um numero, imprimindo o seu fatorial.
- No exemplo 2 devemos inserir dois numeros, imprimindo o maior.
- No exemplo 3 devemos inserir dois numeros, imprimindo a soma.