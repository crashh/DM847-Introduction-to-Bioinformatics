import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.List;

public class SELO {
    private static Set<Character> characters = new HashSet<>();
    private static Color BACKGROUND_COLOR = Color.WHITE;
    private static Map<Character, Color> wordColors = new HashMap<>();

    private static Color[] colorPool = {
            new Color(0xFFD1DC),
            new Color(0xC23B22),
            new Color(0xB39EB5),
            new Color(0xCFCFC4),
            new Color(0xB19CD9),
            new Color(0xDEA5A4),
            new Color(0x77DD77),
            new Color(0x966FD6),
            new Color(0x836953),
            new Color(0xCB99C9),
            new Color(0xFF6961),
            new Color(0xFDFD96),
            new Color(0xF49AC2),
            new Color(0xFFB347),
            new Color(0x03C03C),
            new Color(0xAEC6CF),
            new Color(0x779ECB),
            new Color(0),
            new Color(0xA4C639),
            new Color(0x9966CC)
    };
    private static Random random = new Random();

    private static final int BASE_X = 20;
    private static final int BASE_Y = 245;
    private static final int WIDTH = 20;
    private static final int MAX_HEIGHT = 300;

    public static void main(String[] args) throws IOException {
        File source = new File(args[0]);
        Scanner scanner = new Scanner(source);
        List<Map<Character, Integer>> count = new ArrayList<>();
        Map<Character, Integer> globalCount = new HashMap<>();
        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            for (int i = 0; i < line.length(); i++) {
                if (count.size() == i) count.add(new HashMap<>());
                Map<Character, Integer> map = count.get(i);
                char key = line.charAt(i);
                characters.add(key);
                wordColors.put(key, colorPool[Arrays.asList(characters.toArray()).indexOf(key)]);
                globalCount.put(key, globalCount.getOrDefault(key, 0) + 1);
                map.put(key, map.getOrDefault(key, 0) + 1);
            }
        }
        drawOutput(produceProbabilities(count), produceBackgroundFrequencies(globalCount));
    }

    private static void drawOutput(List<Map<Character, Double>> allDistributions,
                                   Map<Character, Double> backgroundFrequency) throws IOException {
        BufferedImage imgTet = new BufferedImage(600, 250, BufferedImage.TYPE_INT_ARGB);

        Graphics2D g = imgTet.createGraphics();
        g.setColor(BACKGROUND_COLOR);
        g.fillRect(0, 0, 10000, 10000);

        g.setRenderingHint(
                RenderingHints.KEY_TEXT_ANTIALIASING,
                RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

        for (int i = 0; i < allDistributions.size(); i++) {
            Map<Character, Double> distribution = allDistributions.get(i);
            double relativeEntropy = getRelativeEntropy(distribution, backgroundFrequency);
            int height = (int) Math.abs(MAX_HEIGHT / relativeEntropy);

            Map<Character, Integer> heights = new HashMap<>();
            distribution.entrySet()
                    .stream()
                    .forEach(entry -> {
                        double value = entry.getValue();
                        heights.put(entry.getKey(), (int) (value * height));
                    });

            int x = BASE_X + WIDTH * i;
            final int[] y = {BASE_Y};

            heights.entrySet().stream().sorted(Comparator.comparing(Map.Entry::getValue)).forEach(entry -> {
                drawResizedCharacter(g, entry.getKey(), entry.getValue(), new Point(x, y[0]));
                y[0] -= entry.getValue();
            });
        }

        g.dispose();
        ImageIO.write(imgTet, "png", new File("output.png"));
    }

    private static List<Map<Character, Double>> produceProbabilities(List<Map<Character, Integer>> rawData) {
        List<Map<Character, Double>> output = new ArrayList<>();
        double size = (double) rawData.get(0).values().stream().mapToInt(i -> i).sum();

        for (Map<Character, Integer> column : rawData) {
            HashMap<Character, Double> remapped = new HashMap<>();
            for (Character key : column.keySet()) {
                remapped.put(key, column.get(key) / size);
            }
            output.add(remapped);
        }
        return output;
    }

    private static Map<Character, Double> produceBackgroundFrequencies(Map<Character, Integer> data) {
        Map<Character, Double> output = new HashMap<>();
        double sum = data.values().stream().mapToInt(i -> i).sum();
        data.forEach((key, value) -> output.put(key, value / sum));
        return output;
    }

    private static double getEntropy(Map<Character, Double> probabilityDistribution) {
        return -probabilityDistribution.values().stream().mapToDouble(pij -> pij * log2(pij)).sum();
    }

    private static double getRelativeEntropy(Map<Character, Double> probabilityDistribution,
                                             Map<Character, Double> backgroundFrequency) {
        return -probabilityDistribution.entrySet()
                .stream()
                .mapToDouble(e -> e.getValue() * log2(e.getValue() / backgroundFrequency.get(e.getKey())))
                .sum();
    }

    private static double getInformationContent(Map<Character, Double> probabilityDistribution) {
        double entropy = getEntropy(probabilityDistribution);
        return log2(characters.size()) - entropy;
    }

    public static double log2(int n) {
        return (Math.log(n) / Math.log(2));
    }

    public static double log2(double n) {
        return (Math.log(n) / Math.log(2));
    }

    private static BufferedImage getDrawnCharacter(char c, Color color) {
        BufferedImage imgTet = new BufferedImage(256, 256, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = imgTet.createGraphics();
        g2d.setFont(new Font(Font.MONOSPACED, Font.PLAIN, 12));

        FontMetrics fm = g2d.getFontMetrics();
        String text = String.valueOf(c);
        int width = fm.stringWidth(text);
        int height = fm.getAscent();

        g2d.setColor(color);
        g2d.drawString(text, 0, fm.getAscent());

        g2d.dispose();
        return imgTet.getSubimage(0, 0, width, height);
    }

    private static void drawResizedCharacter(Graphics g, char c, int targetHeight, Point position) {
        BufferedImage characterImage = getDrawnCharacter(c, wordColors.get(c));
        g.drawImage(characterImage, position.x, position.y - targetHeight, characterImage.getWidth(), targetHeight, null);
    }

}
