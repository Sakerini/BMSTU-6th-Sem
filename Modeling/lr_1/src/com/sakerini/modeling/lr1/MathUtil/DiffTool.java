package com.sakerini.modeling.lr1.MathUtil;

import java.util.List;

public class DiffTool {
    public static double function(double x, double u) {
        return x * x + u * u;
    }

    public static double pikarOne(double x) {
        return Math.pow(x, 3) / 3.0;
    }

    public static double pikarTwo(double x) {
        return Math.pow(x, 3) / 3.0 * (1 + Math.pow(x, 4) / 21.0);
    }

    public static double pikarThree(double x) {
        return Math.pow(x, 3) / 3.0 * (1.0 +
                1.0 / 21.0 * Math.pow(x, 4) +
                2.0 / 693.0 * Math.pow(x, 8) +
                1.0 / 19845.0 * Math.pow(x, 12));
    }

    public static double pikarFour(double x) {
        return (Math.pow(x, 3) / 3.0 + Math.pow(x, 7) / 63.0 + Math.pow(x, 11) / 2079.0 * 2.0 +
                Math.pow(x, 15) / 218295.0 * 13 + Math.pow(x, 19) / 441.0 / 84645.0 * 82.0 +
                Math.pow(x, 23) / 68607.0 / 152145.0 * 662.0 + Math.pow(x, 27) / Math.pow(3, 11) / 18865.0 * 4.0 +
                Math.pow(x, 31) / 194481.0 / 564975.0);
    }

    public static double[] obvious(List<Double> x, double step) {
        double[] y = new double[x.size()];
        y[0] = 0;
        for (int i = 1; i < x.size(); i++) {
            y[i] = y[i - 1] + step * function(x.get(i - 1), y[i - 1]);
        }
        return y;
    }

    public static double[] runge2(List<Double> x, double step) {
        double[] y = new double[x.size()];
        double yVar = 0;
        for (int i = 1; i < x.size(); i++) {
            yVar += step * function((x.get(i) + step / 2), yVar + step / 2 * function(x.get(i), yVar));
            y[i] = yVar;
        }
        return y;
    }
}
