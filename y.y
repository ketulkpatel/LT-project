
%{
#include<stdio.h> 
extern FILE *yyin;
float DOLLAR=70;
float EURO=80;
float BITCOIN=400000;
float RUPEES=1;
%} 
%union{
int i;
float f;
}
%token <i> NUMBER <f> FLOAT
%token what will be the dollar rupees bitcoin euro value of 
%type <f> S E A B C D P Q R 
%%

S: what will be the E{$$=$5;};
E: dollar A  		{$$=$2;}
   |euro B             {$$=$2;}
   |rupees C           {$$=$2;}
   |bitcoin D 	       {$$=$2;}
   ;

A: value of the P   {$$=$4;};
B: value of the Q   {$$=$4;};
C: value of the R   {$$=$4;};
D: value of the S   {$$=$4;};
  
P:rupees NUMBER '?'	{$$=($2/DOLLAR)*RUPEES;printf("value of %d rupees in dollar is:%f \n",$2,$$);}
  |bitcoin NUMBER '?'	{$$=($2/DOLLAR)*BITCOIN;printf("value of %d bitcoin in dollar is:%f \n",$2,$$);}
  |euro NUMBER '?'		{$$=($2/DOLLAR)*EURO;printf("value of %d euro in dollar is:%f \n",$2,$$);}
  ;
Q:rupees NUMBER '?'	{$$=($2/EURO)*RUPEES;printf("value of %d rupees in euro is:%f \n",$2,$$);}
  |bitcoin NUMBER '?'	{$$=($2/EURO)*BITCOIN;printf("value of %d bitcoin in euro is:%f \n",$2,$$);}
  |dollar NUMBER '?'	{$$=($2/EURO)*DOLLAR;printf("value of %d dollar in euro is:%f \n",$2,$$);}
  ;
R:dollar NUMBER '?'	{$$=($2/RUPEES)*DOLLAR;printf("value of %d dollar in rupees is:%f \n",$2,$$);}
  |bitcoin NUMBER '?'	{$$=($2/RUPEES)*BITCOIN;printf("value of %d bitcoin in rupees is:%f \n",$2,$$);}
  |euro NUMBER '?'		{$$=($2/RUPEES)*EURO;printf("value of %d euro in rupees is:%f \n",$2,$$);}
  ;
S:rupees NUMBER '?'	{$$=($2/BITCOIN)*RUPEES;printf("value of %d rupees in bitcoin is:%f \n",$2,$$);}
  |dollar NUMBER '?'	{$$=($2/BITCOIN)*DOLLAR;printf("value of %d dollar in bitcoin is:%f \n",$2,$$);}
  |euro NUMBER '?'		{$$=($2/BITCOIN)*EURO;printf("value of %d euro in bitcoin is:%f \n",$2,$$);}
  ;	
%%
void yyerror(char *s){}
int main(int argc, char *argv[]) 
{
yyin=fopen(argv[1],"r");
int i;
for(i=1;i<=12;i++){
yyparse();
}
fclose(yyin);
return 0;
}