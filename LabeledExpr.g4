grammar LabeledExpr;

/* Syntax analizer */

prog: stat+ ;

stat
	: expr NEWLINE          # printExpr
	| ID '=' expr NEWLINE   # assign
	| NEWLINE               # blank
	;

expr
	: expr expr op=('+'|'-'|'*'|'/'|'**'|'%')  # binaryOp
	| INT                   # Int
	| ID                    # Id
	| '(' expr ')'          # Parens
	;

/* Lexical analizer */

MUL: '*' ;
DIV: '/' ;
ADD: '+' ;
SUB: '-' ;
EXP: '**';
MOD: '%';

ID     : [a-zA-Z]+ ;
INT    : [0-9]+ ;
NEWLINE: '\r'? '\n' ;
WS     : [ \t]+ -> skip ;