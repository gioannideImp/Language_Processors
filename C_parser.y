%code requires{
  #include "ast.hpp"

  extern const Expression *g_root; // A way of getting the AST out

  //! This is to fix problems when generating C++
  // We are declaring the functions provided by Flex, so
  // that Bison generated code can call them.
  int yylex(void);
  void yyerror(const char *);
}


// Represents the value associated with AST node.
%union {

//POSSIBLE AST NODE VALUES

}


%token None SEMICOLON PREPROCESSOR COMMA POINTER NUMBER HEX OCTAL FLOAT_LITERAL int_NUM DIGIT IDENTIFIER WHITESPACE NEWLINE AUTO BREAK CASE CHAR CONST
%token CONTINUE	DEFAULT	DO DOUBLE ELSE ENUM EXTERN FLOAT FOR GOTO IF INT LONG REGISTER RETURN SHORT SIGNED SIZEOF STATIC STRUCT SWITCH TYPEDEF UNION UNSIGNED 
%token VOID VOLATILE WHILE SIGNED_CHAR UNSIGNED_CHAR UNSIGNED_SHORT UNSIGNED_INT UNSIGNED_LONG LONG_DOUBLE LONG_LONG UNSIGNED_LONG_LONG INTMAX_T UINTMAX_T LROUND
%token RROUND LSQUARE RSQUARE LCURLY RCURLY DOT_OP POINTER_OP LOGICAL_NOT_OP BITWISE_NOT_OP PLUS_OP MINUS_OP INC_OP DEC_OP MULT DIV MODULUS_OP SHIFT_LEFT_OP SHIFT_RIGHT_OP
%token LT GT LE	GE EQ NOT_EQ AND XOR OR LOG_AND	LOG_OR COND_OP ASSIGN_OP SHRT_ASSIGNPLUS SHRT_ASSIGNMINUS SHRT_ASSIGNMULT SHRT_ASSIGNMOD SHRT_ASSIGNAND	SHRT_ASSIGNOR
%token SHRT_ASSIGNXOR SHRT_ASSIGNLSHIFT	SHRT_ASSIGNRSHIFT STRING_LITERAL COMMENT

%union{
  const Statement* statement
  std::string *text
}%

%type <statement> STATEMENT
%type <text> INT
%type <text> IDENTIFIER
%type <text> SEMICOLON
%start ROOT 

%%

ROOT: STATEMENT { g_root = $1; }

STATEMENT: INT IDENTIFIER SEMICOLON { $$ = new Statement($2); }


%%

const Expression *g_root; // Definition of variable (to match declaration earlier)

const Expression *parseAST()
{
  g_root=0;
  yyparse();
  return g_root;
}
