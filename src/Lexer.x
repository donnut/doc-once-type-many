{
module Lexer (
       Token (..)
       ) where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]

tokens :-
       $white+         ;
       "@param"        { \s -> Param }
       "@return"       { \s -> Return }
       "@privat"       { \s -> Private }
\{function\}    { \s -> FunctionType }
       \{string\}      { \s -> StringType }
       \{number\}      { \s -> NumberType }
       \{boolean\}     { \s -> BooleanType }
       $alpha [$alpha $digit]* { \s -> String s }
       
{
-- Each action has type :: String -> Token

-- Token type:
data Token = Param
           | Return
           | Private
           | FunctionType
           | StringType
           | NumberType
           | BooleanType
           | String String
           deriving (Eq, Show)

--main = do
--     s <- getContents
--     print (alexScanTokens s)
-- }
