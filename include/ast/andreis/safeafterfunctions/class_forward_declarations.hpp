#ifndef CLASS_FORWARD
#define CLASS_FORWARD
#include <limits.h>
#include <math.h>
#include <bitset>
#include <memory>
#include <stdio.h>
#include <string.h>
class AssignmentExpression;



struct bindings {
		int word_size = 0;
		std::string id = "";		//name of variable
		double value = 0;
		std::string scope = "";		//name of scope the variable is in
		int offset = 0;			//the stack offset saved on the stack to load it from
		std::string DataType;
		int param_offset = 0;
	};

struct function_details{
	int paramters_size = 0;
	std::string name = "";
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
	int totalStackArea = 8; //For the whole stack
	int StackOffset = 0;	//the offset from $sp for each variable
	int Regs=1;
	std::string AssignmentOperator = "df";
	
	int global_value=0;
	int current_value=0;
	std::vector<std::string> EndSwitchLoop;
	std::vector<std::string> Labels;
	std::vector<std::string> Cases;
	bool no_return = true;
	bool ReadingSwitch = false;
	int CaseVectorSize =0;
	std::vector<std::string> LoopHeader;
	bool continue_for = false;
	AssignmentExpression* TestConditionContinue = NULL;
	
	std::vector<function_details> functions_declared;
	function_details funcion_temp;
	std::vector<std::string> Scopes;
	int argument_no = 0;
	bool parameter = false;
	int max_offset = 0;
	char UnaryOperator;

	std::vector<std::string> LastScope;
	
};
inline void print_variables(Context& contxt, std::ofstream& f){
	for(int i=0; i<contxt.Variables.size(); i++)
	{ 
		f << "\n#" << contxt.Variables[i].id << " - " << contxt.Variables[i].scope << " - " << contxt.Variables[i].word_size << " - "<< contxt.Variables[i].value << " - " << contxt.Variables[i].offset << "-" << contxt.Variables[i].param_offset;
		//std::cout << "\n" << contxt.Variables[i].id << " - " << contxt.Variables[i].scope << " - " << contxt.Variables[i].word_size << " - "<< contxt.Variables[i].value << " - " << contxt.Variables[i].offset << "-" << contxt.Variables[i].param_offset;
	}
	f << "\n\n";
	//std::cout << "\n\n";
}

inline std::string labelGenScope(Context& contxt) {

	contxt.LastScope.push_back(std::to_string(contxt.LastScope.size()));
	return contxt.LastScope[contxt.LastScope.size()-1];
		
}

inline std::string labelGen(Context& contxt) {

	contxt.Labels.push_back(std::to_string(contxt.Labels.size()));
	return contxt.Labels[contxt.Labels.size()-1];
		
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

class Statement;
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
