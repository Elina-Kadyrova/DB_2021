import java.io.File;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class SQLGenerator {

    public static void executeSql(File file1, File file2, int n){
        try{
            Statement statement = DBWrapper.getConnection().createStatement();
            String sql = generateSQL(file1, file2, n);
            statement.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static String generateSQL(File file1, File file2, int n){
        StringBuilder sql = new StringBuilder();
        List<String> list1 = GenomParser.parse(file1, n);
        List<String> list2 = GenomParser.parse(file2, n);
        sql.append("CREATE TABLE g1_").append(n).append("varchar);\n");
        for (String el:list1) {
            sql.append("INSERT INTO g1_").append(n).append(" VALUES ('").append(el).append("');\n");
        }
        sql.append("CREATE TABLE g2_").append(n).append("varchar);\n");
        for (String el:list2) {
            sql.append("INSERT INTO g2_").append(n).append(" VALUES ('").append(el).append("');\n");
        }
        return sql.toString();
    }
}
