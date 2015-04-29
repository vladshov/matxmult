// Test File read.cpp : Defines the entry point for the console application.
//

#include <stdio.h>
#include <iostream>
#include <fstream>

#include <math.h>
#include <ctime>

using namespace std;

int main (int argc, char *argv[])
{
	ifstream in_stream;
	in_stream.open(argv[1]);
//	in_stream.open("D:/1.txt");
	int m1;
	int n1;
	in_stream >> m1;
	in_stream >> n1;
	double **A = new double* [m1];
	int i, j;
	for (i = 0; i < m1; i++) {
		(A)[i] = new double [n1];
		for (j = 0; j < n1; j++) {
			in_stream >> A[i][j];
		}
	}
	int m2;
	int n2;
	in_stream >> m2;
	in_stream >> n2;
	double **B = new double* [m2];

	for (i = 0; i < m2; i++) {
		(B)[i] = new double [n2];
		for (j = 0; j < n2; j++) {
			in_stream >> B[i][j];
		}
	}
	in_stream.close();
	int k;
	double **C = new double* [m1];
	for (i = 0; i < m1; i++) {
		(C)[i] = new double [n2];
		for (j = 0; j < n2; j++) {
			C[i][j] = 0;
			for (k = 0; k < n1; k++) {
				C[i][j] += A[i][k]*B[k][j];
			}
		}
	}

	ofstream fs(argv[2]);
//	ofstream fs("D:/2.txt");

    if(!fs)
    {
        cerr<<"Cannot open the output file."<<endl;
        return 1;
    }
	
	for (i = 0; i < m1; i++) {
		for (j = 0; j < n2; j++) {
			fs<< C[i][j];
			fs<< " ";
		}
		fs<< "\n";
	}

    fs.close();
	return 0;
}



