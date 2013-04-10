all: MimoLexer.class MimoParser.class MimoParserVal.class

test: all test.mimo
	java MimoParser test.mimo > test.masm
	./morpho -c test.masm
	./morpho test

MimoLexer.class MimoParser.class MimoParserVal.class: MimoLexer.java MimoParser.java MimoParserVal.java
	javac MimoLexer.java MimoParser.java MimoParserVal.java

MimoLexer.java: mimo.jflex
	jflex mimo.jflex

MimoParser.java MimoParserVal.java: mimo.byaccj
	byaccj -Jclass=MimoParser mimo.byaccj

clean:
	rm -rf *.class *~ *.java *.bak yacc.*
