import java_cup.runtime.Symbol;

%%

%cup
%line
%column
%class Scanner

digito = [0-9]
letra = [a-zA-Z]
hexdigito = [0-9a-fA-F]

FimDeLinha = \r|\n|\r\n
EspacoBranco = {FimDeLinha} | [ \t\f]

Inteiro = {digito}+
Real = {digito}+ \. {digito}+
Hexadecimal = 0x{hexdigito}+

// Comentários de múltiplas linhas
Comentario = "/*" [^*]* ("*"* [^/*] [^*]*)* "*"+ "/"

%%

<YYINITIAL> {
    {EspacoBranco} { /* Ignorar espaços em branco */ }
    {Comentario}   { /* Ignorar comentários */ }

    // Palavras Reservadas
    "program" { return new Symbol(sym.PROGRAM, yyline, yycolumn); }
    "class"   { return new Symbol(sym.CLASS, yyline, yycolumn); }
    "final"   { return new Symbol(sym.FINAL, yyline, yycolumn); }
    "int"     { return new Symbol(sym.INT, yyline, yycolumn); }
    "float"   { return new Symbol(sym.FLOAT, yyline, yycolumn); }
    "void"    { return new Symbol(sym.VOID, yyline, yycolumn); }
    "main"    { return new Symbol(sym.MAIN, yyline, yycolumn); }
    "new"     { return new Symbol(sym.NEW, yyline, yycolumn); }
    "print"   { return new Symbol(sym.PRINT, yyline, yycolumn); }
    "read"    { return new Symbol(sym.READ, yyline, yycolumn); }
    "return"  { return new Symbol(sym.RETURN, yyline, yycolumn); }
    "if"      { return new Symbol(sym.IF, yyline, yycolumn); }
    "else"    { return new Symbol(sym.ELSE, yyline, yycolumn); }
    "while"   { return new Symbol(sym.WHILE, yyline, yycolumn); }

    // Símbolos
    "{"  { return new Symbol(sym.ACHAVES, yyline, yycolumn); }
    "}"  { return new Symbol(sym.FCHAVES, yyline, yycolumn); }
    "("  { return new Symbol(sym.APARENTESES, yyline, yycolumn); }
    ")"  { return new Symbol(sym.FPARENTESES, yyline, yycolumn); }
    "["  { return new Symbol(sym.ACOLCHETES, yyline, yycolumn); }
    "]"  { return new Symbol(sym.FCOLCHETES, yyline, yycolumn); }
    ";"  { return new Symbol(sym.PTVIRG, yyline, yycolumn); }
    ","  { return new Symbol(sym.VIRGULA, yyline, yycolumn); }
    "."  { return new Symbol(sym.PONTO, yyline, yycolumn); }
    "==" { return new Symbol(sym.IGUAL, yyline, yycolumn); }
    "!=" { return new Symbol(sym.DIFERENTE, yyline, yycolumn); }
    ">=" { return new Symbol(sym.MAIORIGUAL, yyline, yycolumn); }
    "<=" { return new Symbol(sym.MENORIGUAL, yyline, yycolumn); }
    ">"  { return new Symbol(sym.MAIOR, yyline, yycolumn); }
    "<"  { return new Symbol(sym.MENOR, yyline, yycolumn); }
    "="  { return new Symbol(sym.ATRIBUICAO, yyline, yycolumn); }
    "+"  { return new Symbol(sym.MAIS, yyline, yycolumn); }
    "-"  { return new Symbol(sym.MENOS, yyline, yycolumn); }
    "*"  { return new Symbol(sym.MULTIPLICACAO, yyline, yycolumn); }
    "/"  { return new Symbol(sym.DIVISAO, yyline, yycolumn); }

    // Números
    {Hexadecimal} { return new Symbol(sym.NUM_HEX, yyline, yycolumn, yytext()); }
    {Real}        { return new Symbol(sym.NUM_REAL, yyline, yycolumn, Float.parseFloat(yytext())); }
    {Inteiro}     { return new Symbol(sym.INTEIRO, yyline, yycolumn, Integer.parseInt(yytext())); }

    // Identificadores
    {letra} ({letra}|{digito})* { return new Symbol(sym.IDENT, yyline, yycolumn, yytext()); }
}

// Tratamento de Erros
[^] { 
    System.err.println("Erro Léxico: Caractere inválido '" + yytext() + "' na linha " + (yyline+1) + ", coluna " + (yycolumn+1)); 
}