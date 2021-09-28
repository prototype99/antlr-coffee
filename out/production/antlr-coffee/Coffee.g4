grammar Coffee;

/*
  LEXER
*/

// comments
SINGLE_COMMENT : '//' .*? '\n' ->skip;

// reserved words
BREAK : 'break';
IMPORT : 'import';
INT : 'int';
VOID : 'void';

// operators and symbols
ADD : '+';
LIT : [0-9];
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

program : global_decl* expr EOF;

global_decl : var_decl;

literal : LIT;

op : ADD | MUL ;

var_decl : INT ID (COMMA ID)* SEMI;

expr : LROUND expr RROUND | SUB expr | NOT expr | expr op expr | location | literal;