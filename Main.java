import java.io.FileReader;
import java.io.InputStreamReader;
import java.io.Reader;

public class Main {
    public static void main(String[] args) {
        try {
            // Permite ler de um arquivo passado como argumento ou da entrada padrão (teclado/redirecionamento)
            Reader inputReader;
            if (args.length > 0) {
                inputReader = new FileReader(args[0]);
            } else {
                inputReader = new InputStreamReader(System.in);
            }

            // O JFlex gerou a classe "Scanner" (conforme definido por %class Scanner)
            Scanner lexer = new Scanner(inputReader);
            
            // O JCup gera por padrão a classe "parser"
            parser p = new parser(lexer);

            p.parse();

            System.out.println("Entrada válida!");
        } catch (Exception e) {
            System.err.println("Erro durante o parsing:");
            e.printStackTrace();
        }
    }
}
