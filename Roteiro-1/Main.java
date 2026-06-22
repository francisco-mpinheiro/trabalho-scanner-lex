import java.io.*;

class Main {
    public static void main(String[] args) throws Exception {
        
        // Lendo a entrada pelo arquivo (Alterado para a Atividade 4)
        FileReader in = new FileReader("teste.txt");
        Scanner scanner = new Scanner(in);

        // Lendo a entrada pelo teclado (Comentado)
        // Scanner scanner = new Scanner(System.in);

        parser parser = new parser(scanner);

        try {
            parser.parse();
            System.out.println("\"Arquivo sem erros de sintaxe!\"");
        }
        catch (Exception e) {
            System.out.println("\"Erro de sintaxe:\" " + e);
        }
    }
}
