#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>
#include<string.h>

extern int ext_variable;

struct pair{
    int first;
    int second;
};
typedef struct pair pair; 

enum week{Mon,Tue,Wed,Thur,Fri,Sat,Sun};

void dif(int a,int b)
{
    int c=(a>b)?a-b:b-a;
    printf("Differance is :%d\n",c);
}

int main()
{
    
    if(1&&2||2&&(!4))
    {
        printf("Welcome to this program :) \n");
    }
    char str[100];
    memset(str,'\0',sizeof(str));
    printf("Enter your name : ");
    scanf("%s",str);
    printf("Welcome %s!\n",str);
     
    static int jfj=2;

    auto float p=5.332;
    float j=1.2;
    double k=3.1416;
    int a;
    long long mah=4859385;
    unsigned boy=449349;
    short jgfg=8;


   int age;
   printf("Enter age : \n");
   scanf("%d",&age);

   for(int i=age;;i--)
{
   g: 
     age--;
   s: 
     break;

   if(age>0)
        goto g; //goto label g
   else
        goto s; //goto label s
}

    const double pi=3.1416;

    for(int i=1;i<3;i++)
    {
        for(int j=0;j<2;j++)
        {
            if(i==3)break;
            if(i==j)continue;
            else
            {
                printf("Bingo\n");
            }

        }
    }

    register int djdhjd=8;


    do{
       printf(".");
       djdhjd--;
    }while(djdhjd);

    
    printf("\n");

    int ha,ma;
    printf("Enter 2 number to find their differance : ");
    scanf("%d %d",&ha,&ma);

    dif(ha,ma);

    printf("Did you know? size of int is %lu bytes",sizeof(int));

    printf("\nEnter a 1 to tryout my custom made data type 'pair'.\n");
    printf("Its a data type which I made using struct keyword.\n");
    printf("If you dont want to try it,enter any other number.\n");
    scanf("%d",&a);

    switch(a)
    {
       case 1:
          pair p;
          printf("Enter pair values,separated by space: ");
          scanf("%d %d",&p.first,&p.second);
          printf("The pair values you entered is (%d,%d).\n",p.first,p.second);

          printf("Would you like to findout if the sum of your pair value is even or odd?\n");
          printf("Enter '1' if you want to try it out.\n");
          int c;
          scanf("%d",&c);
          if(c)
          {
              int sum=p.first+p.second;
              printf("Sum of pair is = %d\n",sum);

              (sum%2==0)?printf("%d is even\n",sum):printf("%d is odd\n",sum);
          }

          else
          {
             printf("Thats the end of this program.\nBye :)");
          }

          break;
        default:
          printf("Looks like you didn't entered '1' as input\n");
          printf("I am assuming that you dont want to try my datatype.");
          printf("Thats all right.");
          printf("Best of luck!   :')\nHave a great day.\n");
    }
    return 0;
}