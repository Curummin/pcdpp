# --- Variáveis de Configuração ---
# Compilador C++
CC = g++
# Ferramentas Flex e Bison
FLEX = flex
BISON = bison
# Comando para remover arquivos
RM = rm -f

# --- Diretórios ---
SRC_DIR = src
BUILD_DIR = build
GEN_DIR = $(BUILD_DIR)/generated
BIN_DIR = $(BUILD_DIR)/bin
OUTPUT_DIR = $(BUILD_DIR)/output
EXAMPLES_DIR = $(SRC_DIR)/examples

# --- Nomes dos Arquivos ---
# O nome do nosso compilador
COMPILER_EXEC = $(BIN_DIR)/pcdpp
# O nome do programa final que será executado
PROGRAM_EXEC = $(BIN_DIR)/programa_final

# Arquivos fonte do compilador
LEX_SRC = $(SRC_DIR)/compiler/pcdpp.l
YACC_SRC = $(SRC_DIR)/compiler/pcdpp.y

# Arquivos gerados pelo Flex e Bison
LEX_GEN_SRC = $(GEN_DIR)/lex.yy.c
YACC_GEN_SRC = $(GEN_DIR)/pcdpp.tab.c
YACC_GEN_HEADER = $(GEN_DIR)/pcdpp.tab.h

# Arquivo C++ de saída gerado pelo nosso compilador
CPP_OUTPUT = $(OUTPUT_DIR)/saida.cpp

# Arquivo pcdpp de entrada (padrão: exemplo.pcdpp)
# Pode ser alterado na linha de comando, ex: make run FILE=outro.pcdpp
FILE ?= $(EXAMPLES_DIR)/ex1_fatorial.pcdpp

# --- Regras de Compilação ---

# Regra padrão (executada ao digitar 'make')
# Compila o nosso compilador pcdpp
all: create_dirs $(COMPILER_EXEC)

# Cria os diretórios necessários
create_dirs:
	mkdir -p $(GEN_DIR) $(BIN_DIR) $(OUTPUT_DIR)

# Regra para criar o executável do nosso compilador
$(COMPILER_EXEC): $(LEX_GEN_SRC) $(YACC_GEN_SRC)
	$(CC) -o $(COMPILER_EXEC) $(YACC_GEN_SRC) $(LEX_GEN_SRC)
	@echo "Compilador pcdpp foi criado com sucesso!"

# Regra para gerar o código do analisador sintático (Bison)
$(YACC_GEN_SRC) $(YACC_GEN_HEADER): $(YACC_SRC)
	$(BISON) -d $(YACC_SRC) -o $(YACC_GEN_SRC)
	@mv pcdpp.tab.h $(YACC_GEN_HEADER) 2>/dev/null || true

# Regra para gerar o código do analisador léxico (Flex)
$(LEX_GEN_SRC): $(LEX_SRC) $(YACC_GEN_HEADER)
	$(FLEX) -o $(LEX_GEN_SRC) $(LEX_SRC)

# Regra principal: executa um arquivo .pcdpp diretamente
# 1. Garante que o compilador 'pcdpp' esteja criado (regra 'all')
# 2. Usa o 'pcdpp' para traduzir o FILE para C++
# 3. Compila o C++ gerado
# 4. Executa o programa final
run: all
	@echo "--- Traduzindo $(FILE) para C++ ---"
	$(COMPILER_EXEC) $(FILE) $(CPP_OUTPUT)
	@echo "--- Compilando o código C++ gerado ---"
	$(CC) -o $(PROGRAM_EXEC) $(CPP_OUTPUT)
	@echo "--- Executando o programa final ---"
	$(PROGRAM_EXEC)

# Regra para limpar todos os arquivos gerados
clean:
	$(RM) -r $(BUILD_DIR)
	@echo "Arquivos gerados foram removidos."