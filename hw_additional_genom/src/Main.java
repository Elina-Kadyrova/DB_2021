import java.io.File;
import java.nio.file.Paths;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        File file1 = new File(String.valueOf(Paths.get("src/genom/files.Genom_1-1.txt")));
        File file2 = new File(String.valueOf(Paths.get("src/genom/files.Genom_2-1.txt")));
        SQLGenerator.executeSql(file1, file2, n);
    }
}
