import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBWrapper {
    private static Connection conn;

    public static Connection getConnection() {
        if(conn == null){
            try{
                Class.forName("org.postgresql.Driver");
                conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/java_programming_2021", "postgres", "E18032002");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        return conn;
    }

}
