/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PCDPP_TAB_H_INCLUDED
# define YY_YY_PCDPP_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    TK_INT = 258,                  /* TK_INT  */
    TK_REAL = 259,                 /* TK_REAL  */
    TK_CHAR = 260,                 /* TK_CHAR  */
    TK_ENTRADA = 261,              /* TK_ENTRADA  */
    TK_SAIDA = 262,                /* TK_SAIDA  */
    TK_IF = 263,                   /* TK_IF  */
    TK_ELSE = 264,                 /* TK_ELSE  */
    TK_WHILE = 265,                /* TK_WHILE  */
    TK_FOR = 266,                  /* TK_FOR  */
    TK_INICIO = 267,               /* TK_INICIO  */
    TK_FIM = 268,                  /* TK_FIM  */
    TK_IGUAL = 269,                /* TK_IGUAL  */
    TK_MAIOR_IGUAL = 270,          /* TK_MAIOR_IGUAL  */
    TK_MENOR_IGUAL = 271,          /* TK_MENOR_IGUAL  */
    TK_MAIOR = 272,                /* TK_MAIOR  */
    TK_MENOR = 273,                /* TK_MENOR  */
    TK_DIFERENTE = 274,            /* TK_DIFERENTE  */
    TK_AND = 275,                  /* TK_AND  */
    TK_OR = 276,                   /* TK_OR  */
    TK_NOT = 277,                  /* TK_NOT  */
    TK_SOMA = 278,                 /* TK_SOMA  */
    TK_SUB = 279,                  /* TK_SUB  */
    TK_MUL = 280,                  /* TK_MUL  */
    TK_DIV = 281,                  /* TK_DIV  */
    TK_MOD = 282,                  /* TK_MOD  */
    TK_ATRIB = 283,                /* TK_ATRIB  */
    TK_PV = 284,                   /* TK_PV  */
    TK_DOIS_PONTOS = 285,          /* TK_DOIS_PONTOS  */
    TK_VIRG = 286,                 /* TK_VIRG  */
    TK_PONTO = 287,                /* TK_PONTO  */
    TK_ABRE_PAR = 288,             /* TK_ABRE_PAR  */
    TK_FECHA_PAR = 289,            /* TK_FECHA_PAR  */
    TK_ID = 290,                   /* TK_ID  */
    TK_NUM_INT = 291,              /* TK_NUM_INT  */
    TK_NUM_REAL = 292,             /* TK_NUM_REAL  */
    TK_CHAR_LIT = 293              /* TK_CHAR_LIT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PCDPP_TAB_H_INCLUDED  */
