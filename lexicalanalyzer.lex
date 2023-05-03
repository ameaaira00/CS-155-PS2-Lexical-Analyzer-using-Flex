/* 
* LEXICAL ANALYZER by Aira Mae Aloveros
 * Usage: (1) $ flex lexicalanalyzer.lex
 *        (2a on Mac OS X) $ gcc lex.yy.c -ll 
 *        (2b on Linux)    $ gcc lex.yy.c -lfl
 *        (3) $ ./a.out <filepath>
 *        Note that you may have to use 'sudo' before the commands 1 and 2
 */

%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int lineno = 1;
%}


%%
\/\/[^\n]*\n            { printf("<%s, COMMENT, %d>\n", yytext, lineno); lineno++;}
procedure               { printf("<%s, PROCEDURE, %d>\n", yytext, lineno); }
endwhile                { printf("<%s, ENDWHILE, %d>\n", yytext, lineno); }
endcase                 { printf("<%s, ENDCASE, %d>\n", yytext, lineno); }
forever                 { printf("<%s, FOREVER, %d>\n", yytext, lineno); }
repeat                  { printf("<%s, REPEAT, %d>\n", yytext, lineno); }
endfor                  { printf("<%s, ENDFOR, %d>\n", yytext, lineno); }
output                  { printf("<%s, OUTPUT, %d>\n", yytext, lineno); }
return                  { printf("<%s, RETURN, %d>\n", yytext, lineno); }
"go to "                { printf("<%s, GO_TO, %d>\n", yytext, lineno); }
while                   { printf("<%s, WHILE, %d>\n", yytext, lineno); }
until                   { printf("<%s, UNTIL, %d>\n", yytext, lineno); }
input                   { printf("<%s, INPUT, %d>\n", yytext, lineno); }
array                   { printf("<%s, ARRAY, %d>\n", yytext, lineno); }
exit                    { printf("<%s, EXIT, %d>\n", yytext, lineno); }
else                    { printf("<%s, ELSE, %d>\n", yytext, lineno); }
then                    { printf("<%s, THEN, %d>\n", yytext, lineno); }
case                    { printf("<%s, CASE, %d>\n", yytext, lineno); }
loop                    { printf("<%s, LOOP, %d>\n", yytext, lineno); }
node                    { printf("<%s, NODE, %d>\n", yytext, lineno); }
call                    { printf("<%s, CALL, %d>\n", yytext, lineno); }
stop                    { printf("<%s, STOP, %d>\n", yytext, lineno); }
for                     { printf("<%s, FOR, %d>\n", yytext, lineno); }
end                     { printf("<%s, END, %d>\n", yytext, lineno); }
if                      { printf("<%s, IF, %d>\n", yytext, lineno); }
do                      { printf("<%s, DO, %d>\n", yytext, lineno); }
to                      { printf("<%s, TO, %d>\n", yytext, lineno); }
by                      { printf("<%s, BY, %d>\n", yytext, lineno); }
(true|false)            { printf("<%s, BOOL, %d>\n", yytext, lineno); }
(floor|ceil|log_2|mod)  { printf("<%s, MISCMATH, %d>\n", yytext, lineno); }
(and|or|not)            { printf("<%s, LOGICAL_OPS, %d>\n", yytext, lineno); }
(<=|>=|<|>|!=|==)       { printf("<%s, RELATIONAL_OPS, %d>\n", yytext, lineno); }
=                       { printf("<%s, ASIGNMENT_SYMBOL, %d>\n", yytext, lineno); }
[-+–\/×ˆ]               { printf("<%s, ARITHMETIC_OPS, %d>\n", yytext, lineno); }
[0-9]+                  { printf("<%s, INT_LITERAL, %d>\n", yytext, lineno); }
'[^']*'                 { printf("<%s, STRING_LITERAL, %d>\n", yytext, lineno); }
\(                      { printf("<%s, LPAR, %d>\n", yytext, lineno); }
\)                      { printf("<%s, RPAR, %d>\n", yytext, lineno); }
[,;:\[\]]               { printf("<%s, SEPARATOR, %d>\n", yytext, lineno); }
[a-zA-Z_][a-zA-Z0-9_]*  { printf("<%s, IDENTIFIER, %d>\n", yytext, lineno); }
"\n"                    { lineno++; }
[ \t]                   { /* ignore whitespace */ }
.                       { printf("<%s, UNKNOWN TOKEN, %d>\n", yytext, lineno); }

%%

int main(int argc, char **argv) {
    if (argc <  2) {
        printf("Usage: %s <filepath>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("Failed to open file %s\n", argv[1]);
        return 1;
    }

    yyin = file;
    yylex();

    fclose(file);
    return 0;
}



