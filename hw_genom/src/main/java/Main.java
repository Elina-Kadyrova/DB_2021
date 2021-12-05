import java.util.List;

public class Main {
    public static void main(String[] args) {
        DNADbWrapper post = new DNADbWrapper();
        parseAndInsert(post);
        System.out.println("for dna2: " + post.getPerCentOfCoincidencesFor2(1, 2)* 100);
        System.out.println("for dna5:" + post.getPerCentOfCoincidencesFor5(1, 2)* 100);
        System.out.println("for dna9:" + post.getPerCentOfCoincidencesFor9(1, 2) * 100);
    }

    private static void parseAndInsert(DNADbWrapper post) {

        DNAParser reader1 = new DNAParser("C:\\KFU\\ITIS3sem\\Databases\\GitDB\\hw_genom\\src\\main\\java\\genom_files\\Genome_1-1.txt");
        DNAParser reader2 = new DNAParser("C:\\KFU\\ITIS3sem\\Databases\\GitDB\\hw_genom\\src\\main\\java\\genom_files\\Genome_2-1.txt");

        List<String> t2_1 = reader1.take(2);
        System.out.println("end parse 1_2");
        List<String> t5_1 = reader1.take(5);
        System.out.println("end parse 1_5");
        List<String> t9_1 = reader1.take(9);
        System.out.println("end parse 1_9");
        DNA dna1 = new DNA(1, t2_1, t5_1, t9_1);

        List<String> t2_2 = reader2.take(2);
        System.out.println("end parse 2_2");
        List<String> t5_2 = reader2.take(5);
        System.out.println("end parse 2_5");
        List<String> t9_2 = reader2.take(9);
        System.out.println("end parse 2_9");
        DNA dna2 = new DNA(2, t2_2, t5_2, t9_2);

        post.insertDNA(dna1);
        System.out.println("end insert 1");
        post.insertDNA(dna2);
        System.out.println("end insert 2");
    }
}
