#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

char* rims[10] = {"0", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"};

void read_string(char* str, int *n, FILE *ptr) {
	*n = fread(str, sizeof(char), 1000000, ptr);
}

void print_string(int res_len, char* str, FILE *ptr) {
	for (int i = 0; i < res_len; i++) {
		fprintf(ptr, "%c", str[i]);
	}
}

void process(char* result, int *res_len, char* str, int n) {
	for (int i = 0; i < n; i++) {
		if (str[i] >= '1' && str[i] <= '9') {
			int tmp = strlen(rims[str[i] - '0']);
			for (int j = 0; j < tmp; j++) {
				result[*res_len] = rims[str[i] - '0'][j];
				*res_len = (*res_len) + 1;
			}
		}
		else {
			result[*res_len] = str[i];
			*res_len = (*res_len) + 1;
		}
	}
}

void generate(char* str, int* n) {
	if ((*n) == -1)
		*n = (rand() % 100) + 1;
	for (int i = 0; i < *n; i++) {
		str[i] = (char)(rand() % 128);
	}
}

int main(int argc, char* argv[]) {
	if (argc != 4) {
		puts("Command line doesn't fit pattern '{program_name} -d {input_file_name} {output_file_name}' ");
		puts("or\n'{program_name} -g {string_size} {output_file_name}\n'Program finished.");
		return 0;
	}

	srand(time(NULL));

	char *type, *file_in, *file_out;

	type = argv[1];
	if ((strcmp(type, "-g") != 0 && strcmp(type, "-d") != 0)) {
		puts("Command line doesn't fit pattern '{program_name} -d {input_file_name} {output_file_name}' ");
		puts("or\n'{program_name} -g {string_size} {output_file_name}\n'Program finished.");
		return 0;
	}

	char str[1000000];
	int n = 0;

	if (strcmp(type, "-d") == 0) {
		file_in = argv[2];
		file_out = argv[3];
		FILE *fin_ptr = fopen(file_in, "r");

		if (fin_ptr == NULL) {
			puts("Couldn't open input file.\nProgram finished.");
			return 0;
		}

		read_string(str, &n, fin_ptr);
		fclose(fin_ptr);
	} else {
		n = atoi(argv[2]);
		file_out = argv[3];
		generate(str, &n);
	}

	char result[1000000];
	int res_len = 0;

	clock_t t_start = clock();

	for (size_t z = 0; z < 50000; z++) {
		res_len = 0;
		process(result, &res_len, str, n);
	}

	clock_t t_stop = clock();

	FILE *fout_ptr = fopen(file_out, "w");

	if (fout_ptr == NULL) {
		puts("Couldn't open output file.\nProgram finished.");
		return 0;
	}

	fprintf(fout_ptr, "input data:\n");
	print_string(n, str, fout_ptr);
	fprintf(fout_ptr, "\n\noutput data:\n");
	print_string(res_len, result, fout_ptr);
	printf("Spent time:%f sec.\n", (t_stop - t_start * 1.0) / CLOCKS_PER_SEC);
	fclose(fout_ptr);

	return 0;
}