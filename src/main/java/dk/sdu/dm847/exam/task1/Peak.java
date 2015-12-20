package dk.sdu.dm847.exam.task1;

public class Peak {
    private final String measurementName;
    private final String peakName;
    private final double t;
    private final int r;
    private final double signal;
    private final int indexT;
    private final int indexR;
    private int uniqueId = -1;

    public Peak(String measurementName, String peakName, double t, int r, double signal, int indexT, int indexR) {
        this.measurementName = measurementName;
        this.peakName = peakName;
        this.t = t;
        this.r = r;
        this.signal = signal;
        this.indexT = indexT;
        this.indexR = indexR;
    }

    public double distanceTo(Peak other) {
        return Math.sqrt(Math.pow(other.getT() - t, 2) + Math.pow(other.getR() - r, 2));
    }

    public String getMeasurementName() {
        return measurementName;
    }

    public String getPeakName() {
        return peakName;
    }

    public double getT() {
        return t;
    }

    public int getR() {
        return r;
    }

    public double getSignal() {
        return signal;
    }

    public int getIndexT() {
        return indexT;
    }

    public int getIndexR() {
        return indexR;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Peak peak = (Peak) o;

        if (Double.compare(peak.t, t) != 0) return false;
        if (r != peak.r) return false;
        if (Double.compare(peak.signal, signal) != 0) return false;
        if (indexT != peak.indexT) return false;
        if (indexR != peak.indexR) return false;
        if (measurementName != null ? !measurementName.equals(peak.measurementName) : peak.measurementName != null)
            return false;
        return peakName != null ? peakName.equals(peak.peakName) : peak.peakName == null;

    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = measurementName != null ? measurementName.hashCode() : 0;
        result = 31 * result + (peakName != null ? peakName.hashCode() : 0);
        temp = Double.doubleToLongBits(t);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + r;
        temp = Double.doubleToLongBits(signal);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + indexT;
        result = 31 * result + indexR;
        return result;
    }

    @Override
    public String toString() {
        return "Peak{" +
                "measurementName='" + measurementName + '\'' +
                ", peakName='" + peakName + '\'' +
                ", t=" + t +
                ", r=" + r +
                ", signal=" + signal +
                ", indexT=" + indexT +
                ", indexR=" + indexR +
                '}';
    }

    public int getUniqueId() {
        return uniqueId;
    }

    public void setUniqueId(int uniqueId) {
        this.uniqueId = uniqueId;
    }
}
