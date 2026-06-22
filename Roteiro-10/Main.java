import java.io.*;
import java.io.FileInputStream;
import erros.ListaErros;

class Main {
    public static void main (String[] args) throws Exception {
        FileInputStream in = new FileInputStream("teste.txt");
        
        ListaErros listaErros = new ListaErros();
        Scanner scanner = new Scanner(in, listaErros);
        
        parser parser = new parser(scanner);
        try {
            parser.parse();
            
            if (!listaErros.hasErros()) {
                System.out.println("Sintaxe Correta!");
            } else {
                System.out.println("\nErros encontrados:");
                listaErros.dump();
            }
        } catch (Exception e) {
            System.out.println("Erro fatal durante a compilacao: " + e);
        }
    }
}
