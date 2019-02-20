/*
 * Test
 * package fr.ul.miage.wc; pour sans la console
 */
 package generated.fr.ul.miage.wc;
 
%%

%standalone

%{
	int n = 0;
%}

%eof{
	System.out.println("le nombre est "+n);
%eof}

%%
[^ \n\t]+	{n++;}
[^]			{;}