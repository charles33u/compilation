package fr.ul.miashs.expression;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.Reader;

import generated.fr.ul.miashs.expression.ParserCup;
import generated.fr.ul.miashs.expression.Yylex;

public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		if(args.length != 1) {
			System.err.println("Erreur : il faut un seul et un seul nom de fichier");
			System.exit(0);
			
		}
		String filename = args[0];
		//créer un lexer ou un scanner
		try {
			Reader reader = new FileReader(filename);
			Yylex scanner = new Yylex(reader);
			ParserCup parser = new ParserCup(scanner);
			parser.parse();
			//Ajout
			System.out.printf("=%d\n", parser.resultat);
			System.out.println("Terminé !");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.err.println("Erreur de syntaxe");
		}
	}

}
