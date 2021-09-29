package com.sakerini.modeling.lr1;

import com.sakerini.modeling.lr1.MathUtil.DiffTool;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double xfrom, xto, step;
        System.out.println("Input x from: ");
        xfrom = sc.nextDouble();
        System.out.println("x to: ");
        xto = sc.nextDouble();
        System.out.println("step: ");
        step = sc.nextDouble();

        List<Double> x = new ArrayList<>();
        for (double i = xfrom; i <= xto; i = i + step) {
            x.add(i);
        }

        List<Double> p1 = new ArrayList<>();
        List<Double> p2 = new ArrayList<>();
        List<Double> p3 = new ArrayList<>();
        List<Double> p4 = new ArrayList<>();
        double[] notObvious;
        double[] obvious;

        for (int i = 0; i < x.size(); i++) {
            p1.add(DiffTool.pikarOne(x.get(i)));
            p2.add(DiffTool.pikarTwo(x.get(i)));
            p3.add(DiffTool.pikarThree(x.get(i)));
            p4.add(DiffTool.pikarFour(x.get(i)));
        }

        obvious = DiffTool.obvious(x, step);
        notObvious = DiffTool.runge2(x, step);

        System.out.printf("|%8s|%10s|%10s|%10s|%10s|%10s|%10s|\n",
                "X", "Явный", "Рунге", "Пикар 1", "Пикар 2", "Пикар 3", "Пикар 4");
        double k = 0.0, st = 0.1;
        for (int i = 0; i < x.size(); i++) {
            if (Math.abs(x.get(i) - k) < 0.0000001) {
                System.out.printf("|%8f|%10f| %10f|%10f|%10f|%10f|%10f|\n",
                        x.get(i),
                        obvious[i],
                        notObvious[i],
                        p1.get(i),
                        p2.get(i),
                        p3.get(i),
                        p4.get(i));
                k += st;
            }
        }

        System.out.printf("|%8f|%10f| %10f|%10f|%10f|%10f|%10f|\n",
                xto,
                obvious[x.size() - 1],
                notObvious[x.size() - 1],
                p1.get(x.size() - 1),
                p2.get(x.size() - 1),
                p3.get(x.size() - 1),
                p4.get(x.size() - 1));
    }
}
