grammar Coffee;

/*
  LEXER
*/

// comments
SINGLE_COMMENT : '//' .*? '\n' ->skip;

// reserved words
IMPORT : 'import';
INT : 'int';

// operators and symbols
ADD : '+';
MUL : '*';
SQUOTE : '\'';
SEMI : ';';
COMMA : ',';
LCURLY : '{';
RCURLY : '}';

// identifier
ID : [a-z]+;

// char literal
CHAR_LIT : SQUOTE (~['"\n\t\r\f] | '\\' ['"ntrf]) SQUOTE;

// whitespace
WS : [ \n\t\r\f] -> skip;

/*
  parser
*/

program : global_decl* EOF;

global_decl : var_decl;

var_decl : INT ID (COMMA ID)* SEMI;
