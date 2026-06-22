import java_cup.runtime.Symbol;

%%

%class Scanner
%unicode
%cup
%line
%column

%{
    public Scanner(java.io.InputStream in) {
        this(new java.io.InputStreamReader(in, java.nio.charset.Charset.forName("UTF-8")));
    }
%}

digito = [0-9]
letra = [a-zA-Z]
digitos = [0-9]+
opRelacional = ">" | "<" | ">=" | "<=" | "==" | "!="
Ident = {letra} ({letra} | {digito})*
fimdeLinha = \r | \n | \r\n
espaco = {fimdeLinha} | [ \t\f ]

%%

{opRelacional} {
    return new Symbol (sym.OP_RELACIONAL, yytext());
}

"+" { return new Symbol(sym.MAIS); }
"-" { return new Symbol(sym.MENOS); }
"/" { return new Symbol(sym.DIV); }
"*" { return new Symbol(sym.MULT); }
"%" { return new Symbol(sym.MOD); }
"MOD" { return new Symbol(sym.MOD); }

";" { return new Symbol(sym.PTVIRG); }
"," { return new Symbol(sym.VIRG); }
"." { return new Symbol(sym.PTO); }
"(" { return new Symbol(sym.ABRE_PARENT); }
")" { return new Symbol(sym.FECHA_PARENT); }
"[" { return new Symbol(sym.ABRE_COLCH); }
"]" { return new Symbol(sym.FECHA_COLCH); }
"{" { return new Symbol(sym.ABRE_CHAVE); }
"}" { return new Symbol(sym.FECHA_CHAVE); }

"if" { return new Symbol(sym.KW_IF); }

{digitos} {
    double aux = Double.parseDouble(yytext());
    return new Symbol(sym.NUMBER, new Double(aux));
}

{Ident} { return new Symbol(sym.IDENT, yytext()); }

{espaco} { /* despreza */ }

[^] { 
    return new Symbol(sym.EOF, yyline, yycolumn, yytext());
}
