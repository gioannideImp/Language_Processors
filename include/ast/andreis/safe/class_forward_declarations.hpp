#ifndef CLASS_FORWARD
#define CLASS_FORWARD
#include <limits.h>
#include <math.h>
#include <bitset>
#include <memory>
#include <stdio.h>
#include <string.h>
class AssignmentExpression;

class Statement;

struct bindings {
		int word_size = 0;
		std::string id = "";		//name of variable
		double value = 0;
		std::string scope = "";		//name of scope the variable is in
		int offset = 0;			//the stack offset saved on the stack to load it from
		std::string DataType;
	};


struct CasesJumpTable{

	std::string SwitchScope;
	std::string CaseID;
	bool Used = false;
	std::string ENDLABEL;

};

struct Context{
	bool rhs_of_expression=false;
	bool lhs_of_assignment=false;
	std::string op_name="";

	int declarations_in_a_list=1;
	bool exclamation = false;
	bool tilde = false;
	bool increment = false;
	bool decrement = false;
	bool is_Selective = false;
	bool elseif = false;
	bool initialized = false;
	bool function = false;
	bool negative = false; 	//is value a negative number?
	bool float_ = false;   //is value a floating point?
	bool is_unsigned = false;
	bool protect = false; // to not overwrite function_id
	bool reading = false; // are we reading for stack allocation or are we executing?
	std::string funct_id = "";
	std::vector<bindings> Variables;
	bindings variable;
	int totalStackArea = 0; //For the whole stack
	int StackOffset = 0;	//the offset from $sp for each variable
	int Regs=1;
	std::string AssignmentOperator = "df";
	
	int global_value=0;
	int current_value=0;
	std::vector<std::string> EndSwitchLoop;
	std::vector<std::string> Labels;

	std::vector<CasesJumpTable> Cases;
	std::vector<std::string> CaseLabels;
	CasesJumpTable temp;
	bool Jump = false;
	bool no_return = true;
	bool ReadingSwitch = false;
	
	int WasInSwitchBefore = 0;
	std::vector<std::string> LoopHeader;
	bool continue_for = false;
	AssignmentExpression* TestConditionContinue = NULL;
	bool ExecutedACase = false;
	int CaseCounter=0;
	std::vector<std::string> LastScope;
	std::vector<std::string> Skips;
	std::vector<std::string> ShortCircuit;

};

inline std::string labelGenShortCircuit(Context& contxt) {

	contxt.LastScope.push_back(std::to_string(contxt.LastScope.size()));
	return contxt.LastScope[contxt.LastScope.size()-1];
		
}

inline std::string labelGenScope(Context& contxt) {

	contxt.LastScope.push_back(std::to_string(contxt.LastScope.size()));
	return contxt.LastScope[contxt.LastScope.size()-1];
		
}



inline std::string labelGen(Context& contxt) {

	contxt.Labels.push_back(std::to_string(contxt.Labels.size()));
	return contxt.Labels[contxt.Labels.size()-1];
		
}

inline std::string labelGenCase(Context& contxt) {

	contxt.CaseLabels.push_back(std::to_string(contxt.CaseLabels.size()));
	return contxt.CaseLabels[contxt.CaseLabels.size()-1];
		
}

inline std::string GetBinary32( float value )
{
    union
    {
         float input;   // assumes sizeof(float) == sizeof(int)
         int   output;
    }    data;
 
    data.input = value;
 
    std::bitset<sizeof(float) * CHAR_BIT>   bits(data.output);
 
    return bits.to_string<char,std::char_traits<char>,std::allocator<char> >();
}
		

class Node;



static int count_globals = 0;				//Will count the number of global variables
static int counter_py(0);				//Will be used for indentation
static bool function = false;				//Are we inside a function?
static bool ParametrizedFunction = false;
static bool main_ = false;				//Will be used for emitting the main python code
static std::vector<std::string> GlobalVars; 		//Will be used to store the globals variables
static bool is_while = false;				//Identifies loops for indentation manners
static int parentheses = 0;
static bool elif = false;
static bool ParameterVariable = false;






//// ************************************* 			ANSI C-89



static int biasedOffset = 0;


inline void useReg(std::ofstream& file,std::string operation, int register_no=2) {				//USE THIS FOR USING REGISTERS, HAVE TO RECALL AFTER YOU ARE DONE.

	if(operation == "start") {	
		file << std::endl << "\taddiu\t $sp,$sp,-4";
		file << std::endl << "\tsw\t" << "$" << register_no << ",0($sp)";
		biasedOffset += 4;
	}
	else{
		file << std::endl << "\tlw\t" << "$" << register_no << ",0($sp)";
		file << std::endl << "\taddiu\t $sp,$sp,4";
		biasedOffset -= 4;		
	}
}



class Node{

	public:

		
    		virtual  void print_C(std::ofstream& file) const  {
		}

		 virtual ~Node()  {}
};







class ExternalDeclaration;
class Declaration;
class TranslationalUnit;
class Declaration;
class DeclarationList;
class DirectDeclarator;

class DeclarationSpecifiers;
class TypeQualifier;
class TypeSpecifier;
class TranslationUnit;
class ConditionalExpression;
typedef Node* NodePtr;

class TranslationalUnit;
class FunctionDefinition;
class ExternalDeclaration;


class IterationStatement;
class LabeledStatement;
class SelectionStatement;
class StatementList;
class JumpStatement;
class ExpressionStatement;
class CompoundStatement;
class Declarator;
class ConstantExpression;
class ExpressionStatement;

class Pointer;
class PrimaryExpression;
class PostFixExpression;

class CastExpression;

class DirectAbstractDeclarator;
class AbstractDeclarator;
class ParameterDeclaration;
class ParameterList;
class ParameterTypeList;
class IdentifierList;


class SpecifierQualifierList ;
class Init_Declaration_List ;
class InclusiveAndExpression ;
class TypeName ;




#endif
