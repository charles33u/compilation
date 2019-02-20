/*
* Scanner
*/

package generated.fr.ul.miashs.expression;
import java_cup.runtime.Symbol;

%%
/* options */
%line
%public //Pour que le Yylex soit en public, accessible depuis l'extérieur
%cupsym Sym 
// contient l'interface des commandes sym
%cup //pour flex soit compatible avec cup

/* Option -> %debug*/
/* macros */

SEP = [ \n\t\r]
NUM = [0-9]+

%%
{SEP}	{;}
"+"		{return (new Symbol(Sym.ADD));}
"*"		{return (new Symbol(Sym.MUL));}
"("		{return (new Symbol(Sym.PO));}
")"		{return (new Symbol(Sym.PF));}
{NUM}	{return (new Symbol(Sym.NUM, yytext()));}
<<EOF>> {return (new Symbol(Sym.EOF));}
