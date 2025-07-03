%{
#include "pcdpp.tab.h"
#include <string.h>

extern FILE *output_file;

void handle_float(char* text) {
    char *comma = strchr(text, ',');
    if (comma) {
        *comma = '.';
    }
    fprintf(output_file, "%s", text);
}

%}

%option yylineno
%option noyywrap

letra   [A-Za-z]
digito  [0-9]

%%

"CHAMA"                         { fprintf(output_file, "{ "); return TK_INICIO; }
"NAO_TEM_PRA_ONDE_FUGIR"        { fprintf(output_file, "} "); return TK_FIM; }
"PAI"                           { fprintf(output_file, "int "); return TK_INT; }
"CHEFE"                         { fprintf(output_file, "float "); return TK_REAL; }
"ZE"                            { fprintf(output_file, "char "); return TK_CHAR; }
"FALA COMIGO"                   { fprintf(output_file, "std::cin >> "); return TK_ENTRADA; }
"SALVE"                         { fprintf(output_file, "std::cout << "); return TK_SAIDA; }
"NADA_VE_SERA"                  { fprintf(output_file, "if "); return TK_IF; }
"TRABAIERA"                     { fprintf(output_file, "else "); return TK_ELSE; }
"BOTAR PRA ARREPIAR"            { fprintf(output_file, "while "); return TK_WHILE; }
"SELOCO"                        { fprintf(output_file, "for "); return TK_FOR; }
"=="                            { fprintf(output_file, " == "); return TK_IGUAL; }
">="                            { fprintf(output_file, " >= "); return TK_MAIOR_IGUAL; }
"<="                            { fprintf(output_file, " <= "); return TK_MENOR_IGUAL; }
"!="                            { fprintf(output_file, " != "); return TK_DIFERENTE; }
">"                             { fprintf(output_file, " > "); return TK_MAIOR; }
"<"                             { fprintf(output_file, " < "); return TK_MENOR; }
"&&"                            { fprintf(output_file, " && "); return TK_AND; }
"||"                            { fprintf(output_file, " || "); return TK_OR; }
"!"                             { fprintf(output_file, " ! "); return TK_NOT; }
"+"                             { fprintf(output_file, " + "); return TK_SOMA; }
"-"                             { fprintf(output_file, " - "); return TK_SUB; }
"*"                             { fprintf(output_file, " * "); return TK_MUL; }
"/"                             { fprintf(output_file, " / "); return TK_DIV; }
"%"                             { fprintf(output_file, " %% "); return TK_MOD; }
"="                             { fprintf(output_file, " = "); return TK_ATRIB; }
";"                             { fprintf(output_file, ";\n"); return TK_PV; }
":"                             { fprintf(output_file, ":"); return TK_DOIS_PONTOS; }
","                             { fprintf(output_file, ", "); return TK_VIRG; }
"."                             { fprintf(output_file, "."); return TK_PONTO; }
"("                             { fprintf(output_file, "("); return TK_ABRE_PAR; }
")"                             { fprintf(output_file, ")"); return TK_FECHA_PAR; }

{letra}({letra}|{digito}|"_")* { fprintf(output_file, "%s", yytext); return TK_ID; }
[+-]?{digito}+                  { fprintf(output_file, "%s", yytext); return TK_NUM_INT; }
[+-]?{digito}+(,{digito}+)?     { handle_float(yytext); return TK_NUM_REAL; }
\'({letra}|{digito})\'          { fprintf(output_file, "%s", yytext); return TK_CHAR_LIT; }

[ \t]+                          { }
\n                              { }
.                               { printf("ERRO LEXICO: Caractere invalido '%s' na linha %d\n", yytext, yylineno); }

%%
