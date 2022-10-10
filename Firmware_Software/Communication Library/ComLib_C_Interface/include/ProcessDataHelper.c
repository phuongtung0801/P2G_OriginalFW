#include "ProcessDataHelper.h"
time_t seconds;

void system_counter()
{
    
    
    time(&seconds);
    // if (res >= 0)
    // {
    //     printf("Reset system tick");
    //     millis = 0;
    // }
    // else printf("Nope: %d\n", millis);
}

void store_data(uint64_t total_file_write, uint16_t payload_size, uint16_t header_size, EndpointTestData* object)
{
    static uint64_t counter = 1;
    if (counter <= total_file_write)
        {
            // printf("Counter is: %d\n", counter);
            static char path_new[100];
            char file_path[100];
            strcpy(file_path, "../txt/Position2Go_record_");  
            /*change path every hour_interval*/       
            if (counter == 1 || (counter - 1) % (SPLIT_INTERVAL / AUTOMATIC_DATA_TRIGER_TIME_US) == 0 )
            // if (counter == 1 || (counter - 1) % 20 == 0 )
            {
                cal_path(file_path);
                for (size_t i = 0; i < sizeof(file_path); i++)
                {
                    path_new[i] = file_path[i];
                }
                printf("path new is %s\n", path_new);
            }             
            // static double sec = 0;
            // clock_t last_time = clock();
            /*append to file system*/
            FILE *fp = fopen(path_new, "a");
            for (size_t i = 0; i < (payload_size - header_size)/4; i++)
            {
                fprintf(fp, "%f\n", object->float_payload[i]);
            }
            fclose(fp);
            // clock_t diff = clock() - last_time;
            // sec += ((double)diff / CLOCKS_PER_SEC);
            // printf("Time taken by this function is: %f seconds\n", sec);
            counter++;
        }
    else
        {
            printf("Exiting, Number of sample %d\n", counter - 1);
            exit(0);
        }
}

/*Cal path base on UNIX timestamp*/
void cal_path(char* file_path) 
{
    char index[25];
    const struct tm *tm;
    time_t now;
    now = time ( NULL );
    tm = localtime ( &now );
    clock_t last_time = clock();
    // printf("local time is: %d%d%d\n, last time is: %d\n", tm->tm_year + 1900, tm->tm_mon + 1,  tm->tm_mday, last_time);
    // if (tm->tm_mon + 1 < 9)
    // {
    //     sprintf(index, "%d0%d%d_%02d%02d%02d.txt",tm->tm_year + 1900, tm->tm_mon + 1, tm->tm_mday, tm->tm_hour, tm->tm_min, tm->tm_sec);
    // }
    // else
    sprintf(index, "%d%02d%d_%02d%02d%02d.txt",tm->tm_year + 1900, tm->tm_mon + 1, tm->tm_mday, tm->tm_hour, tm->tm_min, tm->tm_sec);
    
    strcat(file_path,index);
}

void delete_file(char* file_path)
{
    if (!remove(file_path) == 0) {
        printf("The file is not deleted.");
    }
}

void combine_file(uint16_t total)
{
    FILE *f_destination = fopen("../txt/result_total.txt", "w");
    for (size_t i = 0; i < total; i++)
    {
        char file_path[30];
        strcpy(file_path, "../txt/result");
        cal_path(file_path);
       
        /*create delete file path*/
        char file_path_del[20]; 
        printf("size of file path: %d\n", sizeof(file_path));
        for (size_t i = 0; i <= sizeof(file_path); i++)
        {
            file_path_del[i] = file_path[i];
        }           
        
        // Open two files to be merged
        FILE *f_source = fopen(file_path, "r");     
        // Open file to store the result
        char c;
        if (f_source == NULL || f_destination == NULL)
        {
                puts("Could not open files");
                exit(0);
        }
        
        // Copy contents of first file to file3.txt
        while ((c = fgetc(f_source)) != EOF)
        {  
            fputc(c, f_destination);
        }
        fclose(f_source); 
        // printf("file path del is %s\n", file_path_del);
        if (!remove(file_path_del) == 0) {
        // printf("The file is not deleted.");
         }
    }
    fclose(f_destination);
}