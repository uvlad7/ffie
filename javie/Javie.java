// https://github.com/fusesource/jansi
// https://github.com/exoad/ansicolor

public class Javie {
    public static void helloJavie() {
        System.out.println(String.format("Hello from \u001B[38;2;%d;%d;%dmJava\u001B[0m!", 247, 151, 29));
        Runtime.getRuntime().addShutdownHook(new Thread() {
            @Override
            public void run() {
                // f7971d - rgb 247 151 29
                // CodeWhisperer generated
                // System.out.println("Bye from \u001B[38;2;247;151;29mJava\u001B[0m!");
                System.out.println(String.format("Bye from \u001B[38;2;%d;%d;%dmJava\u001B[0m!", 247, 151, 29));
            }
        });
    }
}
