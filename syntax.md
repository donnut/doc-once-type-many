<doc-block> ::= "/**" , <block-content>, "*/";
<block-content> ::= <param> , <block-content> | <return>, <block-content>;
<param> ::= "@param" , <space> "{" , <type> , "}" , <space> <name> |"@param" <space> <type> <space> <name> <space> <description>
<space> ::= " " <space> | " "
<type>  ::= ["function" | "string" | "number" | "boolean"]
<array-type> ::= ("array<" , <type> , ">") | (<type> , "[]")