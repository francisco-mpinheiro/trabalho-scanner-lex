import java.io.*;

class Main {
    public static void main (String[] args) throws Exception {
        FileReader in = new FileReader ("teste.txt");
        Scanner scanner = new Scanner (in);
        parser parser = new parser (scanner);
        try {
            parser.parse();
            System.out.println ("\"Arquivo sem erros de sintaxe!\"");
        } catch (Exception e) {
            System.out.println ("\"Erro de sintaxe:\" " + e);
        }
    }
}
