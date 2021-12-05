import java.util.List;

public class DNA {

    private final Integer id;
    private final List<String> taken2;
    private final List<String> taken5;
    private final List<String> taken9;

    public DNA(Integer id,List<String> taken2, List<String> taken5, List<String> taken9) {
        this.id = id;
        this.taken2 = taken2;
        this.taken5 = taken5;
        this.taken9 = taken9;
    }

    public List<String> getTaken2() {
        return taken2;
    }

    public List<String> getTaken5() {
        return taken5;
    }

    public List<String> getTaken9() {
        return taken9;
    }

    public Integer getId() {
        return id;
    }
}
