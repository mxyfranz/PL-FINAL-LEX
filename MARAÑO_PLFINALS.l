%{
// Maraño, Mary France
// BSCS 3A
// 2nd SY23-24 CS 3212-Programming Languages
%}
%{
#include <stdio.h>

// Define the token types
enum yytokentype {
    IDENTIFIER = 258,
    INTEGER_LITERAL,
    FLOAT_LITERAL,
    STRING_LITERAL,
    ASSIGN,
    PLUS,
    MINUS,
    MULTIPLY,
    DIVIDE,
    MODULO,
    LESS_THAN,
    GREATER_THAN,
    LESS_THAN_EQUAL,
    GREATER_THAN_EQUAL,
    EQUAL,
    LOGICAL_OR,
    LOGICAL_AND,
    LOGICAL_NOT,
    OPENING_PARENTHESIS,
    CLOSING_PARENTHESIS,
    OPENING_CURLY,
    CLOSING_CURLY,
    OPENING_SQUARE,
    CLOSING_SQUARE,
    TUPLE,
    SEMICOLON,
    CARET,
    POWER,
    TILDE,
    BACKTICK,
    AT,
    HASH,
    DOLLAR,
    AMPERSAND,
    QUESTION,
    PERIOD,
    ERROR
};

void print_token(const char* token_type, const char* lexeme) {
    printf("%s: %s\n", token_type, lexeme);
}
%}

DIGIT       [0-9]
LETTER      [a-zA-Z_]
ID          {LETTER}({LETTER}|{DIGIT})*
INT         {DIGIT}+
FLOAT       {DIGIT}+"."{DIGIT}+
STRING      \"([^\\\"]|\\.)*\"|'([^\\']|\\.)*'

%%

{ID}        { print_token("IDENTIFIER", yytext); }
{INT}       { print_token("INTEGER_LITERAL", yytext); }
{FLOAT}     { print_token("FLOAT_LITERAL", yytext); }
{STRING}    { print_token("STRING_LITERAL", yytext); }

"="         { print_token("ASSIGN", yytext); }
"+"         { print_token("PLUS", yytext); }
"-"         { print_token("MINUS", yytext); }
"*"         { print_token("MULTIPLY", yytext); }
"/"         { print_token("DIVIDE", yytext); }
"%"         { print_token("MODULO", yytext); }
"<="        { print_token("LESS_THAN_EQUAL", yytext); }
">="        { print_token("GREATER_THAN_EQUAL", yytext); }
"<"         { print_token("LESS_THAN", yytext); }
">"         { print_token("GREATER_THAN", yytext); }
"=="        { print_token("EQUAL", yytext); }
"||"        { print_token("LOGICAL_OR", yytext); }
"&&"        { print_token("LOGICAL_AND", yytext); }
"!"         { print_token("LOGICAL_NOT", yytext); }
"("         { print_token("OPENING PARENTHESIS", yytext); }
")"         { print_token("CLOSING PARENTHESIS", yytext); }
"{"         { print_token("OPENING_CURLY", yytext); }
"}"         { print_token("CLOSING_CURLY", yytext); }
"["         { print_token("OPENING_SQUARE", yytext); }
"]"         { print_token("CLOSING_SQUARE", yytext); }
","         { print_token("TUPLE", yytext); }
";"         { print_token("SEMICOLON", yytext); }
"^"         { print_token("CARET", yytext); }
"**"        { print_token("POWER", yytext); }

"~"         { print_token("TILDE", yytext); }
"`"         { print_token("BACKTICK", yytext); }
"@"         { print_token("AT", yytext); }
"#"         { print_token("HASH", yytext); }
"$"         { print_token("DOLLAR", yytext); }
"&"         { print_token("AMPERSAND", yytext); }
"?"         { print_token("QUESTION", yytext); }
"."         { print_token("PERIOD", yytext); }

[ \t\n]     ; // Ignore whitespace
.           { print_token("ERROR", yytext); }

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}