import java.io.*;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class DNAParser {

    private final String filePath;

    public DNAParser(String filePath) {
        this.filePath = filePath;
    }

    public List<String> take(int countOfPortions) {
        List<String> portions = new LinkedList<>();
        Queue<Character> queue = new LinkedList<>();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(filePath)))) {
            String line;
            while((line = reader.readLine()) != null) {
                for (int i = 0; i < line.length(); i++) {
                    if (queue.size() == countOfPortions) {
                        portions.add(buildPortion(queue));
                        queue.poll();
                    }
                    queue.add(line.charAt(i));
                }
            }
        } catch (IOException e) {
            throw new IllegalArgumentException(e);
        }
        return portions;
    }

    private String buildPortion(Queue<Character> characters) {
        StringBuilder builder = new StringBuilder();
        for (Character character: characters) {
            builder.append(character);
        }
        return builder.toString();
    }
}
