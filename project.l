%{
  #include<stdio.h>
  #include<string.h>
  #include<stdbool.h>
  #include<stdlib.h>
  int total =0;

  char keyword[2000];//Keywords
  char Identifier[2000];//Identifiers
  char AO[2000];//Assignment Operator.
  char LO[2000];//Logical Operator.
%}

%%


#.* {total++; fprintf(yyout,"%-25s%s\n\n","Pre-Processor->",yytext);}

[''|,|;(|)|{|}|.|_] {total++; fprintf(yyout,"%-25s%s\n\n","Delimeter->",yytext);}

[[]] {total++; fprintf(yyout,"%-25s%s\n\n","Delimeter->",yytext);}

"#"|"@"|"$"|"^"|"%"|"^"|"&" {total++; fprintf(yyout,"%-25s%s\n\n","Special Charecter->",yytext);}

"["|"]" {total++; fprintf(yyout,"%-25s%s\n\n","Delimeter->",yytext);}


"="  {total++; fprintf(yyout,"%-25s%s\n\n","Assignment Operator->",yytext);}


"+"|"-"|"*"|"/"  {total++; fprintf(yyout,"%-25s%s\n\n","Arithmetic Operator->",yytext);}

"&&"|"||"|"!"|"nand"|"xor"|"nor"|"xnor"  {total++; fprintf(yyout,"%-25s%s\n\n","Logical Operator->",yytext);}

"<="|">="|"++"|"!="|"=="|"<"|">"  {total++; fprintf(yyout,"%-25s%s\n\n","Relational-operator->",yytext);}

("int")|("if")|("else")|("while")|("do")|("break")|("continue")|("double")|("float")|("return")|("EOF") {total++; fprintf(yyout,"%-25s%s\n\n","Keyword->",yytext);}

("return")|("register")|("char")|("case")|("sizeof")|("long")|("short")|("extern")|("typedef")|("switch")|("unsigned")|("void")|("static")|("struct")|("goto") {total++; fprintf(yyout,"%-25s%s\n\n","Keyword->",yytext);}

[a-zA-Z_][a-zA-Z0-9_]*\( {total++; fprintf(yyout,"%-25s%s\n\n","Function->",yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {total++; fprintf(yyout,"%-25s%s\n\n","Identifier->",yytext);}

[0-9]*"."[0-9]+ {total++; fprintf(yyout,"%-25s%s\n\n","Fractional Constant->",yytext);}

[-][0-9]*"."[0-9]+ {total++; fprintf(yyout,"%-25s%s\n\n","Fractional Negative Fraction->",yytext);}

[0-9]+ {total++; fprintf(yyout,"%-25s%s\n\n","Constant->",yytext);}

"-"[0-9]+ {total++; fprintf(yyout,"%-25s%s\n\n","Negative Constant->",yytext);}

["]([^"\\\n]|\\.|\\\n)*["] {total++; fprintf(yyout,"%-25s%s\n\n","String->",yytext);}

"//".*" "*    {total++; fprintf(yyout,"%-25s%s\n\n","Single-Line Comment->",yytext);}

\/\*(.*\n)*.*\*\/    {total++; fprintf(yyout,"%-25s%s\n\n","Multi-line Comment->",yytext);}

. {fprintf(yyout,"",yytext);}

[\t\n]+

%%

int yywrap()
{
    return 1;
}

int main()
{
    extern FILE *yyin, *yyout; 

    yyin = fopen("prog.c", "r"); 
  
   
    yyout = fopen("Table_of_tokens(output).txt", "w"); 

    fprintf(yyout,"*******Table of Tokens********\n");
    
    fprintf(yyout,"___________________________________________\n");
    fprintf(yyout,"___________________________________________\n");
    fprintf(yyout,"%-19s%-9s%s\n","Token Type","||","Lexeme");
    fprintf(yyout,"___________________________________________\n");
    fprintf(yyout,"___________________________________________\n");
    yylex();


	fprintf(yyout,"\n\n\n\n\n Total Tokens = %d",total);
	 

    return 0; 
}