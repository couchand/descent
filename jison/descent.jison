/* let's do some jison */ 

%%

file
  : class_list NEWLINE EOF
    { return $class_list; }
  ;

class_list
  : cls
    { $$ = [$cls]; }
  | class_list NEWLINE cls
    { $$ = $class_list; $$.push($cls); }
  ;

cls
  : class_name NEWLINE class_body
    { $$ = new ast.ApexClass( $class_name, null, $class_body ); }
  | visibility class_name NEWLINE class_body
    { $$ = new ast.ApexClass( $class_name, $visibility, $class_body ); }
  ;

visibility
  : GLOBAL
    { $$ = ast.GLOBAL; }
  | PUBLIC
    { $$ = ast.PUBLIC; }
  | READABLE
    { $$ = ast.READABLE; }
  | PRIVATE
    { $$ = ast.PRIVATE; }
  ;

class_name
  : VAR
    { $$ = yytext; }
  ;

class_body
  : INDENT class_members DEDENT
    { $$ = $class_members; }
  ;

class_members
  : class_member
    { $$ = [$class_member]; }
  | class_members NEWLINE class_member
    { $$ = $class_members; $$.push($class_member) }
  ;

class_member
  : property
    { $$ = $property; }
  | method
    { $$ = $method; }
  ;

method
  : METHOD method_name ':' parameters '->' method_body
    { $$ = new ast.Method( $method_name, null, $parameters, $method_body ); }
  | METHOD visibility method_name ':' parameters '->' method_body
    { $$ = new ast.Method( $method_name, $visibility, $parameters, $method_body ); }
  ;

method_name
  : VAR
    { $$ = yytext; }
  ;

parameters
  :
    { $$ = []; }
  | '(' param_list ')'
    { $$ = $param_list; }
  ;

param_list
  :
    { $$ = []; }
  | param
    { $$ = [$param]; }
  | param_list ',' param
    { $$ = $param_list; $$.push( $param ); }
  ;

param
  : assignee
    { $$ = $assignee; }
  ;

method_body
  : assignee
    { $$ = [$assignee]; }
  | NEWLINE INDENT assignee DEDENT
    { $$ = [$assignee]; }
  ;

property
  : visibility assignee
    { $$ = new ast.Property( $assignee, $visibility ); }
  | visibility assignee '=' value
    { $$ = new ast.Property( $assignee, $visibility, $value ); }
  | assignee
    { $$ = new ast.Property( $assignee ); }
  | assignee '=' value
    { $$ = new ast.Property( $assignee, null, $value ); }
  ;

assignee
  : VAR
    { $$ = new ast.Variable( yytext ); }
  ;

value
  : VAR
    { $$ = new ast.Variable( yytext ); }
  | NUM
    { $$ = new ast.IntLiteral( yytext ); }
  | NEWLINE INDENT value DEDENT
    { $$ = $value; }
  ;
