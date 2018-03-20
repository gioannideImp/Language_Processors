%option noyywrap
%option yylineno

%{


/* Bring in our declarations for token types and
   the yylval variable. */

#include "C_parser.tab.hpp"
#include <stdlib.h>		
#include <string>
#include <iostream>
#include "../include/ast/class_forward_declarations.hpp"		


void yyerror (char const *s);
extern FILE *yyin;
extern FILE *yyout;

int token(int T);
int vtoken(int T);
int type();

int LineNo = 1;			//Used for debugging


// This is to work around an irritating bug in Flex
extern "C" int fileno(FILE *stream);
%}

%%
#[^\n]*\n		{  return vtoken(PREPROCESSOR); LineNo++;}

"/*"			{  }

"//"[^\n]*              { /* consume //-comment */ }

"auto"			{  return token(AUTO);}

"break"			{  return token(BREAK); }

"case"			{  return token(CASE); }

"char"			{ if(contxt.typedefs_) {
				 contxt.TypeDef.TypeSpec = "char";
			} 
				return token(CHAR);
			}

"const"			{  return token(CONST); }

"continue"		{  return token(CONTINUE); }

"default"		{  return token(DEFAULT); }

"do"			{  return token(DO); }

"double"		{  if(contxt.typedefs_) { 
				contxt.TypeDef.TypeSpec = "double";
			   } 
			    return token(DOUBLE);
			}

"else"			{  return token(ELSE); }

"enum"			{  return token(ENUM); }

"extern"		{  return token(EXTERN); }

"float"			{ if(contxt.typedefs_) { 
				contxt.TypeDef.TypeSpec = "float";
			  } 
			  return token(FLOAT);
			}

"for"			{  return token(FOR); }

"goto"			{  return token(GOTO); }

"if"			{  return token(IF); }

"int"			{  if(contxt.typedefs_) { 
				contxt.TypeDef.TypeSpec = "int";
			   } 
			     return token(INT);
			}

"long"			{ if(contxt.typedefs_) { 
				contxt.TypeDef.TypeSpec = "long";
			  } 
				return token(LONG);
			}

"register"		{  return token(REGISTER); }

"return"		{  return token(RETURN); }

"short"			{  if(contxt.typedefs_) { 
				contxt.TypeDef.TypeSpec = "short";
			   } 
			    return token(SHORT);
			}

"signed"		{  if(contxt.typedefs_) { 
				contxt.TypeDef.TypeSpec = "signed";
			   } 
				return token(SIGNED);
			}

"sizeof"		{  return token(SIZEOF); }

"static"		{  return token(STATIC); }

"struct"		{  return token(STRUCT); }

"switch"		{  return token(SWITCH); }

"typedef"		{ contxt.typedefs_ = true;
			  return token(TYPEDEF);
			}

"union"			{  return token(UNION); }

"unsigned"		{  if(contxt.typedefs_) { 
				contxt.TypeDef.TypeSpec = "unsigned";
			   }
			   return token(UNSIGNED);
			}

"void"			{  if(contxt.typedefs_) { 
				contxt.TypeDef.TypeSpec = "void";
			} 
			  return token(VOID);
			}

"volatile"		{  return token(VOLATILE); }

"while"			{  return token(WHILE); }

[A-Za-z_]([A-Za-z_]|[0-9])* 						{ 
									if(contxt.typedefs_) {
										int i=0;
										while( yytext[i] != NULL){
											contxt.TypeDef.DummyName += yytext[i];
											i++;
										}
										contxt.TypeAssoc.push_back(contxt.TypeDef);
										contxt.typedefs_ = false;
										contxt.TypeDef.DummyName = "";
									} 
										return type();
									}

0[xX][a-fA-F0-9]+((u|U)|(u|U)?(l|L|ll|LL)|(l|L|ll|LL)(u|U))?		{  return token(CONSTANT); }

0[0-7]*((u|U)|(u|U)?(l|L|ll|LL)|(l|L|ll|LL)(u|U))?			{  return token(CONSTANT); }

[1-9][0-9]*((u|U)|(u|U)?(l|L|ll|LL)|(l|L|ll|LL)(u|U))?			{  return token(CONSTANT); }

[a-zA-Z_]?'(\\.|[^\\'\n])+'						{  return token(CONSTANT); }

[0-9]+([Ee][+-]?[0-9]+)(f|F|l|L)?					{  return token(CONSTANT); }

[0-9]*"."[0-9]+([Ee][+-]?[0-9]+)?(f|F|l|L)?				{  return token(CONSTANT); }

[0-9]+"."[0-9]*([Ee][+-]?[0-9]+)?(f|F|l|L)?				{  return token(CONSTANT); }

0[xX][a-fA-F0-9]+([Pp][+-]?[0-9]+)(f|F|l|L)?				{  return token(CONSTANT); }

0[xX][a-fA-F0-9]*"."[a-fA-F0-9]+([Pp][+-]?[0-9]+)(f|F|l|L)?        	{  return token(CONSTANT); }

0[xX][a-fA-F0-9]+"."[a-fA-F0-9]*([Pp][+-]?[0-9]+)(f|F|l|L)?        	{  return token(CONSTANT); }

["][^\n\"]*["] 		{  return vtoken(STRING_LITERAL); }

"..."			{  return token(ELLIPSIS); }

">>="			{  return token(RIGHT_ASSIGN); }

"<<="			{  return token(LEFT_ASSIGN); }

"+="			{  return token(ADD_ASSIGN); }

"-="			{  return token(SUB_ASSIGN); }

"*="			{  return token(MUL_ASSIGN); }

"/="			{  return token(DIV_ASSIGN); }

"%="			{  return token(MOD_ASSIGN); }

"&="			{  return token(AND_ASSIGN); }

"^="			{  return token(XOR_ASSIGN); }

"|="			{  return token(OR_ASSIGN); }

">>"			{  return token(RIGHT_OP); }

"<<"			{  return token(LEFT_OP); }

"++"			{  return token(INC_OP); }

"--"			{  return token(DEC_OP); }

"->"			{  return token(PTR_OP); }

"&&"			{  return token(AND_OP); }

"||"			{  return token(OR_OP); }

"<="			{  return token(LE_OP); }

">="			{  return token(GE_OP); }

"=="			{  return token(EQ_OP); }

"!="			{  return token(NE_OP); }

";"			{  return(SEMICOLON); }

("{"|"<%")		{  return('{'); }

("}"|"%>")		{  return('}'); }

","			{  return(','); }

":"			{  return(':'); }

"="			{  return('='); }

"("			{  return('('); }

")"			{  return(')'); }

("["|"<:")		{  return('['); }

("]"|":>")		{  return(']'); }

"."			{  return('.'); }

"&"			{  return('&'); }

"!"			{  return('!'); }

"~"			{ return(TILDE); }

"-"			{  return token(MINUS); }

"+"			{  return token(PLUS);  }

"*"			{  return token(MULTIPLY); }

"/"			{  return token(DIVIDE); } 

"%"			{  return token(MODULO); }

"<"			{  return token(LT);    }

">"			{  return token(GT);    }

"^"			{  return('^'); }

"|"			{  return('|'); }

"?"			{  return('?'); }

[\n]			{ LineNo++; }

[ \t\v\n\f\r]		{ /*ignore*/ }

.			{ yyerror (yytext); }

%%

/* Error handler. This will get called if none of the rules match. */
void yyerror (char const *s)
{
  	fprintf (stderr, "Error: %s\n", s); /* s is the text that wasn't matched */
	std::cerr << "Terminated At line: " << LineNo << " due to Syntax/Lexical error" << std::endl;
	
  	exit(1);
}

int type(){
	yylval.text = new std::string(yytext);
	for(int i(0); i < contxt.TypeAssoc.size(); i++){
		
		if(*(yylval.text) == contxt.TypeAssoc[i].DummyName){
			if(contxt.TypeAssoc[i].TypeSpec == "int"){
				yylval.text = new std::string("int");
				return TYPE_NAME_;}
			if(contxt.TypeAssoc[i].TypeSpec == "char"){
				yylval.text = new std::string("char");
				return TYPE_NAME_;}
			if(contxt.TypeAssoc[i].TypeSpec == "float"){
				yylval.text = new std::string("float");
				return TYPE_NAME_;}
			if(contxt.TypeAssoc[i].TypeSpec == "double"){
				yylval.text = new std::string("double");
				return TYPE_NAME_;}
			if(contxt.TypeAssoc[i].TypeSpec == "short"){
				yylval.text = new std::string("short");
				return TYPE_NAME_;}
			if(contxt.TypeAssoc[i].TypeSpec == "long"){
				yylval.text = new std::string("long");
				return TYPE_NAME_;}
			if(contxt.TypeAssoc[i].TypeSpec == "unsigned"){
				yylval.text = new std::string("unsigned");
				return TYPE_NAME_;}
			if(contxt.TypeAssoc[i].TypeSpec == "signed"){
				yylval.text = new std::string("signed");
				return TYPE_NAME_;}
			if(contxt.TypeAssoc[i].TypeSpec == "void"){
				yylval.text = new std::string("void");
				return TYPE_NAME_;}					
		}				
	}
		
	return IDENTIFIER;
}
	

int token(int T) {
		yylval.text = new std::string(yytext);		
		
		return T;
}

int vtoken(int T){
	if( T == STRING_LITERAL) {	
		std::string temp = yytext;
		std::string temp2;
    		temp[temp.find_first_of('"')] = 0;
    		temp[temp.find_last_of('"')] = 0;
		for ( unsigned i = 0; i < temp.size(); ++i){
			if(temp[i] != 0) {
				temp2 += temp[i];
			}
		}
		yylval.text = new std::string(temp2);
	}

	else{
	        std::string temp = yytext;
		std::string temp2;
    		temp[temp.find_first_of('#')] = 0;
		for ( unsigned i = 0; i < temp.size(); ++i){
			if(temp[i] != 0) {
				temp2 += temp[i];
			}
		}
		yylval.text = new std::string(temp2);
	}	
	
	return T;
}	

/*	int token(int T) {
		
		if( T == IDENTIFIER || T == STRING_LITERAL || T == CONSTANT) {
			return vtoken(T);

		}

		else{
			yylval.text = new std::string(yytext);
			return T;
		}
	}

	int vtoken(int T){
		
		if( T == IDENTIFIER ) {

	        	yylval.text = new std::string(yytext);
		}

		else if( T == CONSTANT ) {

	        	yylval.text = new std::string(yytext);

		}		

		else if( T == STRING_LITERAL) {

			std::string temp = yytext;
			std::string temp2;
		    	temp[temp.find_first_of('"')] = 0;
		    	temp[temp.find_last_of('"')] = 0;
			for ( unsigned i = 0; i < temp.size(); ++i){
				if(temp[i] != 0) {
					temp2 += temp[i];
				}
			}
			yylval.text = new std::string(temp2);
		}
		return T;
	}	
*/
