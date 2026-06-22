import java_cup.runtime.Symbol;

%%

%class Scanner
%cupsym sym
%cup
%unicode
%line
%column
%public

%{
    public Scanner(java.io.InputStream in) {
        this(new java.io.InputStreamReader(in, java.nio.charset.Charset.forName("UTF-8")));
    }
%}

digito = [0-9]
letra = [a-zA-Z]
digitos = [0-9]+
numeroDecimal = {digitos}"."{digitos}
opRelacional = ">" | "<" | ">=" | "<=" | "==" | "!="

Ident = {letra} ({letra} | {digito})*

fimdeLinha = \r | \n | \r\n
espaco = {fimdeLinha} | [ \t\f ]

%%

{numeroDecimal} {
    return new Symbol(sym.NUMBER, Double.valueOf(yytext()));
}

{digitos} {
    return new Symbol(sym.NUMBER, Integer.valueOf(yytext()));
}

"program" { return new Symbol(sym.KW_PROGRAM); }

{opRelacional} {
    String opRelacional = yytext();
    return new Symbol(sym.OP_RELACIONAL, opRelacional);
}

"+" { return new Symbol(sym.MAIS); }
"-" { return new Symbol(sym.MENOS); }
"/" { return new Symbol(sym.DIV); }
"*" { return new Symbol(sym.MULT); }
"%" { return new Symbol(sym.MOD); }
"=" { return new Symbol(sym.IGUAL); }

";" { return new Symbol(sym.PTVIRG); }
"(" { return new Symbol(sym.ABRE_PARENT); }
")" { return new Symbol(sym.FECHA_PARENT); }
"{" { return new Symbol(sym.ABRE_CHAVE); }
"}" { return new Symbol(sym.FECHA_CHAVE); }
"[" { return new Symbol(sym.ABRE_COLCH); }
"]" { return new Symbol(sym.FECHA_COLCH); }
"." { return new Symbol(sym.PTO); }
"," { return new Symbol(sym.VIRG); }

{Ident} { return new Symbol(sym.IDENT, yytext()); }

{espaco} { /* despreza */ }

[^] { 
    return new Symbol(sym.EOF);
}
