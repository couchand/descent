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
  : assignment
    { $$ = ['Assignment', $assignment]; }
  ;

assignment
  : assignee '=' value
    { $$ = [$assignee, $value]; }
  ;

assignee
  : VAR
    { $$ = ['var', yytext]; }
  ;

value
  : VAR
    { $$ = ['var', yytext]; }
  | NUM
    { $$ = ['num', yytext]; }
  ;
