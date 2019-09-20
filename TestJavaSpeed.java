import java.io.*;
import java.util.*;
import java.math.*;

public class TestJavaSpeed{
    public static void main(String[] args) {
        double[] array1 = new double[750];
        double[] array2 = new double[750];
        for (int i = 0; i < 750; i++)
        {
            array1[i] = Math.random();
            array2[i] = Math.random();
        }
        double sum = 0;
        double StartTime = System.nanoTime();
        for (int k = 0; k < 8400; k++){
            for (int step = 0; step < 33600; step++){
                for (int i = 0; i < 750; i++){
                    sum = sum + Math.pow(array1[i]-array2[i],2);
                }
            }
        }
        //System.out.println("Sum = " + sum);
        double EndTime = System.nanoTime();
        double TimePassed = (EndTime - StartTime) / Math.pow(10,9);
        System.out.println("Finished! Running time is " + TimePassed + "s. ");
    }
}