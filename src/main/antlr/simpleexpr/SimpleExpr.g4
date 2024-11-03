grammar SimpleExpr;

prog : stat* EOF ;//这里要从prog开始分析

stat : expr ';'
    | ID '=' expr ';'
    |'print' expr ';'
    ;

expr : expr ('*' | '/') expr
    |  expr ('+' | '-') expr
    |  '(' expr ')'
    | ID
    | INT
    | FLOAT
    ;

SEMI : ';' ;
ASSIGN : '=' ;
PRINT : 'print' ;
MUL : '*' ;
DIV : '/' ;
ADD : '+' ;
SUB : '-' ;
LPAREN : '(' ;
RPAREN : ')' ;

ID : ('_' | LETTER) WORD* ;
INT : '0'|('+'|'-')? [1-9]NUMBER* ;//? denotes 0|1
FLOAT : INT '.'NUMBER*
|'.' NUMBER+
;
SL_COMMENT : '//' .*? '\n' -> skip ;
ML_COMMENT : '/*' .*? '*/' -> skip ;
DOCS_COMMENT : '/**' .*? '*/' -> skip ;

WS : [ \t\r\n]+ -> skip ;
//辅助编译
fragment LETTER : [a-zA-Z] ;
fragment NUMBER : [0-9];
fragment WORD : '_'| NUMBER| LETTER ;