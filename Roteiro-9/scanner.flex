import java_cup.runtime.Symbol;
import erros.ListaErros;

%%

%class Scanner
%cupsym sym
%cup
%unicode
%line
%column
%public

%{
    // atributo
    private ListaErros listaErros;

    // Redefinindo "sobrecarga" o construtor de Scanner para usar listaErros
    public Scanner(java.io.InputStream in, ListaErros listaErros) {
        this(new java.io.InputStreamReader(in, java.nio.charset.Charset.forName("UTF-8")));
        this.listaErros = listaErros;
    }
    
    public Scanner(java.io.Reader in, ListaErros listaErros) {
        this(in);
        this.listaErros = listaErros;
    }

    public ListaErros getListaErros() {
        return listaErros;
    }

    public void defineErro(int linha, int coluna, String texto) {
        listaErros.defineErro(linha, coluna, texto);
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
    return new Symbol(sym.NUMBER, yyline, yycolumn, Double.valueOf(yytext()));
}

{digitos} {
    return new Symbol(sym.NUMBER, yyline, yycolumn, Integer.valueOf(yytext()));
}

"program" { return new Symbol(sym.KW_PROGRAM, yyline, yycolumn); }

"if" { return new Symbol(sym.KW_IF, yyline, yycolumn); }
"else" { return new Symbol(sym.KW_ELSE, yyline, yycolumn); }

"while" { return new Symbol(sym.KW_WHILE, yyline, yycolumn); }
"for" { return new Symbol(sym.KW_FOR, yyline, yycolumn); }
"do" { return new Symbol(sym.KW_DO, yyline, yycolumn); }

"true" { return new Symbol(sym.KW_TRUE, yyline, yycolumn); }
"false" { return new Symbol(sym.KW_FALSE, yyline, yycolumn); }

{opRelacional} {
    return new Symbol(sym.OP_RELACIONAL, yyline, yycolumn, yytext());
}

"+" { return new Symbol(sym.MAIS, yyline, yycolumn); }
"-" { return new Symbol(sym.MENOS, yyline, yycolumn); }
"/" { return new Symbol(sym.DIV, yyline, yycolumn); }
"*" { return new Symbol(sym.MULT, yyline, yycolumn); }
"%" { return new Symbol(sym.MOD, yyline, yycolumn); }
"=" { return new Symbol(sym.IGUAL, yyline, yycolumn); }

";" { return new Symbol(sym.PTVIRG, yyline, yycolumn); }
"(" { return new Symbol(sym.ABRE_PARENT, yyline, yycolumn); }
")" { return new Symbol(sym.FECHA_PARENT, yyline, yycolumn); }
"{" { return new Symbol(sym.ABRE_CHAVE, yyline, yycolumn); }
"}" { return new Symbol(sym.FECHA_CHAVE, yyline, yycolumn); }
"[" { return new Symbol(sym.ABRE_COLCH, yyline, yycolumn); }
"]" { return new Symbol(sym.FECHA_COLCH, yyline, yycolumn); }
"." { return new Symbol(sym.PTO, yyline, yycolumn); }
"," { return new Symbol(sym.VIRG, yyline, yycolumn); }

{Ident} { return new Symbol(sym.IDENT, yyline, yycolumn, yytext()); }

{espaco} { /* despreza */ }

[^] { 
    this.defineErro(yyline, yycolumn, "Lexico - Simbolo desconhecido: " + yytext());
}
