/* let's do some jison */ 

%%

file
  : class_list EOF
    { return $class_list; }
  ;

class_list
  : cls
    { $$ = [$cls]; }
  | class_list NEWLINE cls
    { $$ = $class_list; $$.unshift($cls); }
  ;

cls
  : class_name NEWLINE
    { $$ = [$class_name]; }
  | class_name NEWLINE class_body
    { $$ = [$class_name, $class_members]; }
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
    { $$ = $class_members; $$.unshift($class_member) }
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
    { $$ = yytext; }
  ;

value
  : VAR
    { $$ = ['var', yytext]; }
  | NUM
    { $$ = ['num', yytext]; }
  ;
