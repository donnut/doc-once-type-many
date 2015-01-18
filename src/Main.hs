module Main where

import Parser
import Lexer
import Control.Monad
import System.Environment

data Type = Function
          | Array
          | String
          | Number
            
data ParamName = ParamName String

data Tags = Param Type ParamName
          | Private
          | Return Type

parseType :: Parser Type
parseType = do
  char '{'
  x <- many (noneOf "}")
  char '}'
  return $ case x of
    "function" -> Function
    "array" -> Array
    "string" -> String
    "number" -> Number

parseName :: Parser ParamName
parseName = liftM ParamName $ many1 alphaNum
            
parseParam :: Parser Tags
parseParam = do
  string "@param"
  spaces
  ptype <- parseType
  spaces
  pname <- parseName
  return $ Param ptype pname

parseExpr :: Parser Tags
parseExpr = parseParam

readExpr :: String -> String
readExpr input = case parse parseExpr "jsdoc" input of
  Left err -> "No match: " ++ show err
  Right val -> "Found value"

main :: IO ()
main = do
  args <- getArgs
  putStrLn (readExpr (args !! 0))
