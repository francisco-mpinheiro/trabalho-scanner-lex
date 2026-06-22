import java_cup.runtime.Symbol;

%%
%class Scanner
%unicode
%cup
%line
%column

%{
    // Codigo para ler direto do teclado ou arquivo
    public Scanner(java.io.InputStream in) {
        this(new java.io.InputStreamReader(in, java.nio.charset.Charset.forName("UTF-8")));
    }
%}

digitos = [0-9]+
fimdeLinha = \r | \n | \r\n
espaco = {fimdeLinha} | [ \t\f ]

%%

{digitos} {
    double aux = Double.parseDouble(yytext());
    return new Symbol(sym.NUMBER, new Double(aux));
}

"+" { return new Symbol(sym.MAIS); }
"-" { return new Symbol(sym.MENOS); }
"/" { return new Symbol(sym.DIV); }
"*" { return new Symbol(sym.MULT); }
"%" { return new Symbol(sym.MOD); }
"MOD" { return new Symbol(sym.MOD); }
";" { return new Symbol(sym.PTVIRG); }
"(" { return new Symbol(sym.ABRE_PARENT); }
")" { return new Symbol(sym.FECHA_PARENT); }

{espaco} { /* despreza */ }

[^] { 
    /* Caractere invalido */
    return new Symbol(sym.EOF, yyline, yycolumn, yytext());
}
