/**
	JFlex lesgreinir fyrir MIMO, einfallt forritunarmál
	sem byggir á og er samhæft Morpho.
	Höfundur: Ólafur Óskar Egilsson, olioskar@gmail.com

	Verkefni í Þýðendum, Kennari: Snorri Agnarsson
	Þetta skjal byggir á gögnum frá kennara.
*/

%%

%public
%class MimoLexer
%unicode
%byaccj
%line
%column
%x COMMENT

%{
int nesting = 0;

public MimoParser yyparser;

public MimoLexer( java.io.Reader r, MimoParser yyparser )
{
	this(r);
	this.yyparser = yyparser;
}

public int getLine() { return yyline; }
public int getColumn() { return yycolumn; }
%}
 
	/* Reglulegar skilgreiningar */
_DIGIT=[0-9]
_FLOAT={_DIGIT}+\.{_DIGIT}+([eE][+-]?{_DIGIT}+)?
_INT={_DIGIT}+
_OPCHAR=[\+\-*/!%&=><\:\^\~&|?]
_OP={_OPCHAR}+
_STRING=\"([^\"\\]|\\b|\\t|\\n|\\f|\\r|\\\"|\\\'|\\\\|(\\[0-3][0-7][0-7])|\\[0-7][0-7]|\\[0-7])*\"
_CHAR=\'([^\'\\]|\\b|\\t|\\n|\\f|\\r|\\\"|\\\'|\\\\|(\\[0-3][0-7][0-7])|(\\[0-7][0-7])|(\\[0-7]))\'
_DELIM=[()\[\]{},;.$#\!=]
_ALPHA=[:letter:]
_NAME=(_|{_ALPHA})(_|{_ALPHA}|{_DIGIT})*

%%

{_FLOAT} {
	yyparser.yylval = new MimoParserVal(yytext());
	return MimoParser.DOUBLE;
}

"||" {
	return MimoParser.OR;
}

"&&" {
	return MimoParser.AND;
}

"!" {
	return MimoParser.NOT;
}

{_DELIM} {
	yyparser.yylval = new MimoParserVal(yytext());
	return yycharat(0);
}

{_OP} {
	yyparser.yylval = new MimoParserVal(yytext());
	return MimoParser.OP;
}

{_STRING} {
	yyparser.yylval = new MimoParserVal(yytext());
	return MimoParser.STRING;
}

{_CHAR} {
	yyparser.yylval = new MimoParserVal(yytext());
	return MimoParser.CHAR;
}

{_INT} {
	yyparser.yylval = new MimoParserVal(yytext());
	return MimoParser.INT;
}

"null" {
	yyparser.yylval = new MimoParserVal(yytext());
	return MimoParser.NULL;
}

"true" {
	yyparser.yylval = new MimoParserVal(yytext());
	return MimoParser.TRUE;
}

"false" {
	yyparser.yylval = new MimoParserVal(yytext());
	return MimoParser.FALSE;
}

"if" {
	return MimoParser.IF;
}

"else" {
	return MimoParser.ELSE;
}

"elseif" {
	return MimoParser.ELSEIF;
}

"while" {
	return MimoParser.WHILE;
}

"var" {
	return MimoParser.VAR;
}

"return" {
	return MimoParser.RETURN;
}

{_NAME} {
	yyparser.yylval = new MimoParserVal(yytext());
	return MimoParser.NAME;
}

";;;".*$ {
}

"{;;;" {
	yybegin(COMMENT); nesting++;
}

<COMMENT>"{;;;" {
	nesting++;
}

<COMMENT>";;;}" {
	if( --nesting==0 )
	{
		yybegin(YYINITIAL);
	}
}

<COMMENT>.|\n {
	/* ignore */
}
[ \t\r\n\f] {
}

. {
	return MimoParser.YYERRCODE;
}
