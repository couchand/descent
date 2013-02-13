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
    { $$ = [$class_name, $class_body]; }
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
  : assignee ':' parameters '->' method_body
    { $$ = [$assignee, $parameters, $method_body]; }
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

method_body
  : assignee
    { $$ = [$assignee]; }
  | NEWLINE INDENT assignee DEDENT
    { $$ = [$assignee]; }
  ;

property
  : assignee '=' value
    { $$ = new ast.Property( $assignee, $value ); }
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
