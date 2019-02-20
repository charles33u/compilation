/*
 *  License and Copyright:
 *  This file is part of "wc" project.
 *
 *   It is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   any later version.
 *
 *   It is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
 * 
 *  Copyright 2018 by LORIA, Université de Lorraine
 *  All right reserved
 */

//code utilisateur
//-----------------
package generated.fr.ul.miage.wc;

%%
//options
//-------

//permet de generer automatiquement un main()
%standalone

//actions à executer en fin de fichier
// ici afficher la valeur de n
%eof{
    afficher();
%eof}

//déclaration
//------------

%line

%{
	int k1 = 0;	// compteur de char dans les coms
	int k2 = 0; // COmpteur de caractère en dehors des coms (code)
	int ligne = yyline + 1;
	public void afficher(){
		System.out.printf("k1=%d et k2 =%d \n",k1,k2);
		System.out.printf("%d%%%n", k1*100/(k1+k2));
	} 
%}

//Commentaire

//c1=\/\/.*\n
c1=\/\/.*|\?[^]|\\
c2=\/\*(([^*])|(\*[^/]))*\*\/
c3=\n
commentaire = {c1}|{c2}

%%
//regles lexicales
//----------------

{commentaire}     {k1 += yylength();
				   System.out.println("Commentaire trouvé :"+yytext()+" à la ligne "+ligne);
				   ligne = 5 + ligne;} 
				   //récupère la longeur de la ch récupérée, ajoute à k1
//{c3}              {ligne = ligne + 1;}
[^]      		  {k2++;} //ajout char par char
