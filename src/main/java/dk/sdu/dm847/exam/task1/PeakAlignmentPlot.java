package dk.sdu.dm847.exam.task1;

import java.util.*;
import javax.swing.*;
import java.awt.*;
import java.util.List;
import java.util.stream.Collectors;

public class PeakAlignmentPlot extends JFrame {
    public static final int WIDTH = 1100;
    public static final int HEIGHT = 750;
    public static final int BASE_PLOT_X = 50;
    public static final int BASE_PLOT_Y = 50;
    public static final int PLOT_WIDTH = 400;
    public static final int PLOT_HEIGHT = 400;
    public static final int MAX_T = 2;
    public static final int MAX_R = 130;

    private final JPanel jp;
    private final Collection<List<Peak>> peaks;

    public PeakAlignmentPlot(Collection<List<Peak>> peaks) {
        super("Plot");
        this.peaks = peaks;
        setSize(WIDTH, HEIGHT);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        jp = new Canvas();
        add(jp);
    }

    private Map<String, Integer> getMeasurementNameToIdMap(List<String> names) {
        Map<String, Integer> result = new HashMap<>();
        for (int i = 0; i < names.size(); i++) {
            String name = names.get(i);
            result.put(name, i);
        }
        return result;
    }

    private void drawPlot(Graphics g, Map<String, Integer> measurementNameToIdMap) {
        Random random = new Random();
        peaks.forEach(peakList -> {
            g.setColor(new Color(random.nextInt()));
            peakList.forEach(peak -> {
                Integer id = measurementNameToIdMap.get(peak.getMeasurementName().replace("temp_", "").replace(".csv", ""));
                int x = BASE_PLOT_X + (int) ((peak.getR() / (double) MAX_R) * PLOT_HEIGHT);
                int y = BASE_PLOT_Y + (int) ((peak.getT() / (double) MAX_T) * PLOT_WIDTH);
                System.out.println(peak.getR());
                g.drawString(id.toString(), x, y);
            });
        });
    }

    private void drawLegend(Graphics g, List<String> names) {
        g.drawString("Measurements", BASE_PLOT_X + PLOT_WIDTH + 30, BASE_PLOT_Y);
        for (int i = 0; i < names.size(); i++) {
            g.drawString(i + ": " + names.get(i), BASE_PLOT_X + PLOT_WIDTH + 30, BASE_PLOT_Y + (i + 1) * 20);
        }
    }

    private List<String> calculateMeasurementNames() {
        List<Peak> temp = new ArrayList<>();
        peaks.forEach(temp::addAll);
        return temp.stream()
                .map(it -> it.getMeasurementName().replace("temp_", "").replace(".csv", ""))
                .distinct()
                .collect(Collectors.toList());
    }

    class Canvas extends JPanel {
        public Canvas() {
            setPreferredSize(new Dimension(WIDTH, HEIGHT));
        }

        @Override
        public void paintComponent(Graphics g) {
            super.paintComponent(g);
            List<String> names = calculateMeasurementNames();
            Map<String, Integer> measurementNameToIdMap = getMeasurementNameToIdMap(names);
            drawPlot(g, measurementNameToIdMap);
            drawLegend(g, names);
        }
    }
}
