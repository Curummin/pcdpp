%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yylineno;
extern char* yytext;

void yyerror(const char *s);

extern FILE *yyin;

FILE *output_file;
%}

%token TK_INT TK_REAL TK_CHAR
%token TK_ENTRADA TK_SAIDA
%token TK_IF TK_ELSE TK_WHILE TK_FOR
%token TK_INICIO TK_FIM
%token TK_IGUAL TK_MAIOR_IGUAL TK_MENOR_IGUAL TK_MAIOR TK_MENOR TK_DIFERENTE
%token TK_AND TK_OR TK_NOT
%token TK_SOMA TK_SUB TK_MUL TK_DIV TK_MOD
%token TK_ATRIB
%token TK_PV TK_DOIS_PONTOS TK_VIRG TK_PONTO TK_ABRE_PAR TK_FECHA_PAR
%token TK_ID
%token TK_NUM_INT TK_NUM_REAL TK_CHAR_LIT

%right TK_ATRIB
%left TK_OR
%left TK_AND
%left TK_IGUAL TK_DIFERENTE
%left TK_MENOR TK_MAIOR TK_MENOR_IGUAL TK_MAIOR_IGUAL
%left TK_SOMA TK_SUB
%left TK_MUL TK_DIV TK_MOD
%right TK_NOT

%%

programa
    : lista_comandos
    ;

lista_comandos
    :
    | lista_comandos comando
    ;

comando
    : declaracao_variavel
    | atribuicao
    | entrada
    | saida
    | condicional
    | repeticao
    ;

declaracao_variavel
    : tipo TK_ID TK_PV
    | tipo TK_ID TK_ATRIB expressao TK_PV
    ;

atribuicao
    : TK_ID TK_ATRIB expressao TK_PV
    ;

atribuicao_no_pv
    : TK_ID TK_ATRIB expressao
    ;

tipo
    : TK_INT
    | TK_REAL
    | TK_CHAR
    ;

entrada
    : TK_ENTRADA TK_ID TK_PV
    ;

saida
    : TK_SAIDA expressao TK_PV
    ;

condicional
    : TK_IF TK_ABRE_PAR expressao_logica TK_FECHA_PAR TK_INICIO lista_comandos TK_FIM
    | TK_IF TK_ABRE_PAR expressao_logica TK_FECHA_PAR TK_INICIO lista_comandos TK_FIM TK_ELSE TK_INICIO lista_comandos TK_FIM
    ;

repeticao
    : TK_WHILE TK_ABRE_PAR expressao_logica TK_FECHA_PAR TK_INICIO lista_comandos TK_FIM
    | TK_FOR TK_ABRE_PAR atribuicao_no_pv TK_PV expressao_logica TK_PV atribuicao_no_pv TK_FECHA_PAR TK_INICIO lista_comandos TK_FIM
    ;

expressao_logica
    : expressao
    | expressao_logica TK_AND expressao_logica
    | expressao_logica TK_OR expressao_logica
    | expressao_logica TK_IGUAL expressao_logica
    | expressao_logica TK_DIFERENTE expressao_logica
    | expressao_logica TK_MAIOR expressao_logica
    | expressao_logica TK_MENOR expressao_logica
    | expressao_logica TK_MAIOR_IGUAL expressao_logica
    | expressao_logica TK_MENOR_IGUAL expressao_logica
    | TK_NOT expressao_logica
    | TK_ABRE_PAR expressao_logica TK_FECHA_PAR
    ;

expressao
    : termo
    | expressao TK_SOMA termo
    | expressao TK_SUB termo
    ;

termo
    : fator
    | termo TK_MUL fator
    | termo TK_DIV fator
    | termo TK_MOD fator
    ;

fator
    : TK_ID
    | TK_NUM_INT
    | TK_NUM_REAL
    | TK_CHAR_LIT
    | TK_ABRE_PAR expressao TK_FECHA_PAR
    ;

%%

int main(int argc, char *argv[]) {
    if (argc < 3) {
        printf("Uso: ./pcdpp <arquivo-de-entrada> <arquivo-de-saida>\n");
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Erro: Nao foi possivel abrir o arquivo de entrada '%s'\n", argv[1]);
        return 1;
    }

    output_file = fopen(argv[2], "w");
    if (!output_file) {
        printf("Erro: Nao foi possivel criar o arquivo de saida '%s'\n", argv[2]);
        fclose(yyin);
        return 1;
    }

    fprintf(output_file, "#include <iostream>\n\n");
    fprintf(output_file, "#include <string>\n\n");
    fprintf(output_file, "int main() {\n");

    yyparse();

    fprintf(output_file, "\nreturn 0;\n}\n");

    fclose(yyin);
    fclose(output_file);

    printf("Compilacao concluida com sucesso! Arquivo de saida: %s\n", argv[2]);

    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "ERRO SINTATICO: %s na linha %d, perto do texto: '%s'\n", s, yylineno, yytext);
    exit(1);
}
