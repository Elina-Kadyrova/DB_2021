import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class GenomParser {

    public static List<String> parse(File file, int n){
        List<String> list = new ArrayList<>();
        String s = null;
        try {
            s = String.valueOf(Files.lines(Paths.get(String.valueOf(file))));
        } catch (IOException e) {
            e.printStackTrace();
        }
        for (int i = 0; i < s.length(); i++) {
            list.add(s.substring(i, i + n));
        }
        return list;
    }
}
