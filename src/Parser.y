{
module Parser (
              parseDoc
              ) where

  import Lexer
}

%name parseDoc
%tokentype { Token }
%error { parseError }

%token
  '@param'     { ParamToken }
  '@return'    { ReturnToken }
  '@private'   { PrivateToken }
  '{function}' { FunctionTypeToken }
  '{string}'   { StringTypeToken }
  '{number}'   { NumberTypeToken }
  '{boolean}'  { BooleanTypeToken }
        
%%

Param  : '@param' '{' ParamType '}' ParamName { Param $2 $3 }

ParamType : 'function' {$1}
          | 'string'   {$1}
          | 'number' {$1}
          | 'boolean' {$1}

ParamName : 'string' {$1} 
