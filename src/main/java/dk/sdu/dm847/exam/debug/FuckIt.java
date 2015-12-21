package dk.sdu.dm847.exam.debug;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by dan on 12/21/15.
 */
public class FuckIt {
    public static void main(String[] args) throws IOException {
        List<String> lines = Files.readAllLines(Paths.get("/", "tmp", "data", "peak_alignment.txt"));
        List<List<Double>> points = lines.stream().skip(1).map(it -> {
            String[] split = it.split("\t");
            return Arrays.asList(Double.parseDouble(split[1]), Double.parseDouble(split[2]));
        }).collect(Collectors.toList());
        points.forEach(System.out::println);

        List<Double> distances = new ArrayList<>();
        for (int i = 0; i < points.size(); i++) {
            List<Double> point = points.get(i);
            for (int i1 = i + 1; i1 < points.size(); i1++) {
                List<Double> point2 = points.get(i1);
                distances.add(distanceTo(point.get(0), point2.get(0), point.get(1), point2.get(1)));
            }
        }
        System.out.println(distances.stream().mapToDouble(it -> it).min());

    }

    public static double distanceTo(double t1, double t2, double r1, double r2) {
        return Math.sqrt(Math.pow(t2 - t1, 2) + Math.pow(r2 - r1, 2));
    }
}
