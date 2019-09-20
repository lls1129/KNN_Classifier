import java.math.*;
import java.io.*;

public class KNN_MNIST{
    public static double[][] AddColumn(double[][] dataset, double[] column){
        double[][] newdataset = new double[dataset.length][dataset[0].length + 1];
        for (int i = 0; i < dataset.length; i++){
            for (int j = 0; j < dataset[i].length + 1; j++){
                if (j != dataset[i].length){
                    newdataset[i][j] = dataset[i][j];
                }
                else{
                    newdataset[i][j] = column[i];
                }
            }
        }
        return newdataset;
    }
    public static double[][] ReduceDim(double[][] dataset){
        double[] sum = new double[dataset[0].length];
        double nonezerocolumn = 0;
        for (int i = 0; i < dataset[0].length; i++){
            sum[i] = 0;
            for (int j = 0; j < dataset.length; j++){
                sum[i] = sum[i] + dataset[j][i];
            }
            if(sum[i] != 0){
                sum[i] = 1;
            }
            nonezerocolumn = nonezerocolumn + sum[i];
        }
        int column = (int)nonezerocolumn;
        double[][] ReducedDataset = new double[dataset.length][column];
        int t = 0;
        for (int i = 0; i < column; i++){
            while((t <= i) && (sum[t] == 0)){
                t = t + 1;
            }
            for (int j = 0; j < dataset.length; j++){
                ReducedDataset[j][i] = dataset[j][t];
            }
            t = t + 1;
        }
        return ReducedDataset;
    }


    public static void main(String[] args) {
        double[][] a = new double[5][5];
        double[][] b = new double[5][5];
        for (int i = 0; i < 5; i++){
            for (int j = 0; j < 5; j++){
                a[i][j] = i + j;
                b[i][j] = 0;
            }
            a[i][3] = 0;
        }
        b = ReduceDim(a);
        for (int i = 0; i < b.length; i++){
            for (int j = 0; j < b[0].length; j++){
                System.out.print(b[i][j] + ",");
            }
            System.out.println(",");
        }
    }
}