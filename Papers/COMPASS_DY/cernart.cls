%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Name:     cernart.sty                                          %
%                                                                 %
%  Purpose:  Set LaTeX parameters for CERN article.               %
%                                                                 %
%  This files is based on the artikel1 Dutch class file           %
%                                                                 %
%   - requires packages: subfigure, subeqn, subequation           %
%   - special treatment of title page                             %
%   - command \Prix for indicating printing price at end          %
%                                                                 %
%  Last mod : 10 Oct 1991  mg                                     %
%             25 May 1992  AS adds commands for library ALICE     %
%             \submitted, \collaboration, \conference,            %
%             \note, \dedication                                  %
%             13 Jun 1992  AS check for  \m@th and \reset@font    %
%             10 Mar 1993  AS/MG give footnotes "normal" size     %
%                                titlepage refs use \footnotesize %
%                                    ""     ""  made consistent   %
%                                define \mathrm if undefined      %
%             12 Mar 1993  AS    subsubsection in \normalsize\it  %
%                          MG    define bra, ket and braket       %
%             10 Jan 1995  MG    Include subeqn and friends are   %
%                                Packages                         %
%             20 Apr 1995  MG    Base everything on artikel2.cls  %
%                                and ntg class files              %
%                                                                 %
%             29 Apr 1998  MG    eliminate reference to packages  %
%                                subeqn, subeqnarray and subfigure%
%             11 Oct 2007  MG    introduce \abstractname          %
%                                                                 %
%  MG: Michel Goossens IT/ASD                                     %
%                                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\def\fileversion{2.3}\def\filedate{11 Octobre 2007}
\typeout{Document Style 'CERNART'. Version <\fileversion>, <\filedate>}
% -------------------------------- identification ---------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cernart}[2007/10/11]
% ---------------------------  declaration of options --
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{artikel1}}
% ----------------------------  execution of options ------------------------
\ProcessOptions
% --------------------------------package loading ---------------------------
\LoadClass[a4paper,twoside]{artikel1} % from ntgclass files
 
\setlength{\hoffset}{-1in}
\setlength{\voffset}{-1in}
\setlength{\oddsidemargin}{25mm}
\setlength{\evensidemargin}{25mm}
\setlength{\marginparwidth}{25mm}
\setlength{\marginparsep}{0pt}
\setlength{\topmargin}{2cm}
\setlength{\headheight}{0mm}
\setlength{\headsep}{0mm}
\setlength{\footskip}{30pt}
\setlength{\textwidth}{16cm}
\ifcase \@ptsize
    \setlength{\textheight}{58\baselineskip}
\or
    \setlength{\textheight}{52\baselineskip}
\or
    \setlength{\textheight}{47\baselineskip}
\fi
\addtolength{\textheight}{\topskip}

%%%%%%%%%%%%%%%%%% slight change in lists%%%%%%%%%%%%%%%%%%%
\def\labelitemi{\bf --}
\def\labelitemii{$\m@th\bullet$}
 
%%%%%%%%%%%%%%%%%%%%%% footnotes %%%%%%%%%%%%%%%%%%%%%
\def\footnoterule{\kern-3\p@
 \hrule width .4\columnwidth
 \kern 2.6\p@}
 
%%%%%%%%%%%% Environment makefntext %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\long\def\@makefntext#1{\parindent=\z@
\begin{list}{}%
   {\labelwidth1.5em\leftmargin\labelwidth% set global width
    \labelsep3pt%  horizontal separation between term and item
    \itemsep0pt%   vertical separation between two items
    \parsep0pt%    vertical separation two paragraphs in an item
    \topsep0pt%    vertical separation text/list
    \footnotesize}
    \item [\hfill $^{\mathrm{\@thefnmark)}}$] #1\end{list}}% ***** end of makefntext
 
%%%%%%%%%%%% Environment Figlist %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{Figlist}[1]{% Give highest figure number as parameter
\vskip2mm\begin{center}{\bf FIGURE CAPTIONS}\end{center}
\begin{list}{\bf Fig.\hfill\arabic{figure} : }{\usecounter{figure}
    \settowidth{\labelwidth}{\bf Fig . #1 : }% define global width
    \leftmargin\labelwidth \labelsep0pt
    \itemsep0pt plus 0.1ex minus 0.1ex
    \parsep0pt plus 0.1ex minus 0.1ex
    \topsep\baselineskip}}%
{\end{list}\setcounter{figure}{0}% Reset figure counter
}% ***** end of environment{Figlist} ****

%%%%%%%%%%%% Environment CERNfig %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{CERNfig}{\begingroup % figures, one per page
\def\@makecaption##1##2{\hbox to\hsize{\hfil##1\hfil}}}%
{\endgroup}
% ***** end of environment{CERNfig} ****
 
%%%%%%%%%%%% Environment Tablist %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{Tablist}[1]{% Give highest table number as parameter
\vskip2mm\begin{center}{\bf TABLE CAPTIONS}\end{center}
\begin{list}{\bf Tab.\hfill\arabic{table} : }{\usecounter{table}
    \settowidth{\labelwidth}{\bf Fig . #1 : }% define global width
    \leftmargin\labelwidth \labelsep0pt
    \itemsep0pt plus 0.1ex minus 0.1ex
    \parsep0pt plus 0.1ex minus 0.1ex
    \topsep\baselineskip}}%
{\end{list}\setcounter{table}{0}% Reset table counter
}% ***** end of environment{Tablist} ****
 
%%%%%%%%%%%%%%%%%%%%% TH Division specifics %%%%%%%%%%%%%%%%%%%%
 
% Definition of environment "THtitle" (Title page for TH Division)
\def\Pubnum#1{\def\@Pubnum{#1}}\def\@Pubnum{CERN--TH.xxxx/91}
\def\Pubnumtwo#1{\def\@Pubnumtwo{#1}}\def\@Pubnumtwo{}
\def\Pubnumtthree#1{\def\@Pubnumthree{#1}}\def\@Pubnumthree{}
\def\Pubdate#1{\def\@Pubdate{#1}}\def\@Pubdate{\today}
\newenvironment{THtitlepage}{%
  \thispagestyle{thfirst}\pagenumbering{arabic}%
  \def\title##1{\begin{center}\large\mbox{}\\[2\baselineskip]
                \uppercase{##1}\\[2\baselineskip]\end{center}}
  \def\author##1{\begin{center}\large##1\\[2\baselineskip]\end{center}}
  \renewenvironment{abstract}{% Definition of abstract
  \begin{center}\large \mbox{}\\[2\baselineskip]
  ABSTRACT\\[\baselineskip]\end{center}}%
  {\par\vspace*{2\baselineskip}}
}% End of beginning of THtitlepage
{\newpage\thispagestyle{empty}\mbox{}\newpage% Empty page
  \setcounter{footnote}{0}\setcounter{page}{1}\pagestyle{plain}
  \def\Pubnum##1{}\def\@Pubnum{}\def\Pubnumtwo##1{}\def\@Pubnumtwo{}
  \def\Pubnumthree##1{}\def\@Pubnumthree{}\def\Pubdate##1{}\def\@Pubdate{}
  \def\author##1{}\def\title##1{}
}% End of title page
 
% Definition of running titles for Theory Division
\def\ps@thfirst{\let\@mkboth\@gobbletwo
  \def\@evenhead{}\def\@evenfoot{}% Nothing for even pages
  \def\Rule{\rule[-1.ex]{0ex}{3ex}}
  \def\@oddhead{\hfill\raisebox{0pt}[0pt][0pt]{\rm
   \vtop{\hbox{\@Pubnum\Rule}
       \ifx\@Pubnumtwo\@empty\else\hbox{\@Pubnumtwo\Rule}\fi
       \ifx\@Pubnumthree\@empty\else\hbox{\@Pubnumthree\Rule}\fi}}%
        }%     Running header
  \def\@oddfoot{\raisebox{0pt}[0pt][0pt]{\rm
   \vbox{\hbox{\@Pubnum}\hbox{\@Pubdate}}}\hfill
        }%     Running footer
  \def\sectionmark##1{}
  \def\subsectionmark##1{}
}% First page for Th Division
 
%%%%%%%%%%%%%%%%%%%%% section headings %%%%%%%%%%%%%%%%%%%%%%%%%%

\def\section{\@startsection {section}{1}{\z@}%
{ 1\baselineskip plus  .5\baselineskip minus  .25\baselineskip}%
{+0.1pt plus +0.1pt minus +0.1pt}{\reset@font\normalsize\bfseries}}
 
\def\subsection{\@startsection{subsection}{2}{\z@}%
{ 1\baselineskip plus  .5\baselineskip minus  .25\baselineskip}%
{+0.1pt plus +0.1pt minus +0.1pt}{\reset@font\normalsize\bfseries}}
 
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}%
{ 1\baselineskip plus  .5\baselineskip minus  .25\baselineskip}%
{+0.1pt plus +0.1pt minus +0.1pt}{\reset@font\normalsize\itshape}}
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% \begin{titlepage}
%     \docnum{CERN--EP/90--xx}
%     \date{}
%     \title{ first  line \\
%             second line \\
%             etc...}
%     \author{B.B.Auth\Instref{xx} M.M.~Auth2\Bothref{I1}{A2}
%             C.D.user\Instref{yy} ...}
% Submitted{}
% collaboration{}
% conference{}
% note{}
% dedication{}
%     \Instfoot{xx}{text text}
%     \Instfoot{yy}{text text}
% \end{titlepage}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% title page %%%%%%%%%%%%%%%%%%%%%%%%%5
\def\maketitle{% Dummy maketitle
\typeout{Dummy maketitle --- Use titlepage instead}}
% Definition of environment "titlepage"
\def\titlepage{\clearpage%
\setcounter{footnote}{0}\pagestyle{empty}%
% CERN title
\kern1mm\begin{center}
\mbox{\ifcase\@ptsize \large\or \large\or \normalsize\fi%
EUROPEAN ORGANIZATION FOR NUCLEAR RESEARCH}
\end{center}
\vskip5mm\@normalsize}% End of \titlepage tag
% Document number (flushright)
\def\docnum#1{\hbox to \hsize{\hskip123mm\hbox{#1}\hss}}
% Date (flushright)
\def\date#1{\edef\@temp{#1}\ifx\@temp\@empty\def\@temp{\today}\fi
\hbox to \hsize{\hskip123mm\hbox{\@temp}\hss}}
% Submitted{}
\def\submitted#1{\vskip1em\begin{center}\it#1\end{center}}
% collaboration{}
\def\collaboration#1{\vskip1em\begin{center}\it#1\end{center}}
% conference{}
\def\conference#1{\vskip1em\begin{center}\it#1\end{center}}
% note{}
\def\note#1{\vskip1em\begin{center}\it#1\end{center}}
% dedication{}
\def\dedication#1{\vskip1em\begin{center}\it#1\end{center}}
% Title
\def\title#1{\vskip1em\begin{center}\normalsize\bf#1\end{center}\vskip1.5em}
% Author
%\def\@makefnmark{\hbox to 0pt{$^{\@thefnmark)\,}$\hss}}
\def\@makefnmark{\hbox{$^{\@thefnmark)}$}}
\def\author#1{%% Treat the list of authors
\setcounter{footnote}{0}\def\@currentlabel{}%
\begingroup\def\thefootnote{\arabic{footnote}}
\def\@makefnmark{\hbox{$^{\rm\@thefnmark)}$}}
\global\@topnum\z@ \begin{center}{\lineskip.5em
\begin{tabular}[t]{c}#1\end{tabular}\par}
\end{center}\par\vskip1.5em\@thanks\endgroup}
%
\newenvironment{Authlist}{\center}{\endcenter}
% Abstract
\def\abstract{\begin{center}{\bfseries\abstractname}\\[\baselineskip]%
\end{center}\quotation\small}
\def\endabstract{\endquotation\par}
%
%%%%%%%%%%%% Institute definitions  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\@ifundefined{c@instfoot}{\newcounter{instfoot}}{}
\def\Iref#1{$^{\Inst{#1})}$}   \let\Instref=\Iref
\def\Inst#1{\@ifundefined{r@#1}{{\bf ??}}%
{\edef\@tempa{\@nameuse{r@#1}}\expandafter\@car\@tempa \@nil\null}}
%
%%AS If we found `Instfoot' inside `Authlist' env, we will changes the
%    formatting.
%
\def\Instfoot#1#2{\def\@temp{Authlist}%
\ifx\@temp\@currenvir
    \par #2 \\[2ex]%
\else
    \refstepcounter{instfoot}\label{#1}%
    \xdef\@thefnmark{\arabic{instfoot}}\@footnotetext{#2}%
\fi
}
%
%%%%%%%%%%%% Anotation definitions  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%\@ifundefined{c@anotfoot}{\newcounter{anotfoot}}{}
\@ifundefined{mathrm}{\newcommand{\mathrm}[1]{{\rm#1}}}{}
\def\Aref#1{$^{\mathrm{#1})}$} \let\Anotref=\Aref
\def\Anotfoot#1#2{\xdef\@thefnmark{#1}\@footnotetext{#2}}
%
%%%%%%%%%%%% Anotation references   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\AAref#1#2{$^{\mathrm{#1,#2)}}$}       \let\AnotAnotref=\AAref
\def\IAref#1#2{$^{\Inst{#1},\mathrm{#2)}}$}\let\InstAnotref=\IAref
\def\IIref#1#2{$^{\Inst{#1},\Inst{#2})}$}  \let\InstInstref=\IIref
\def\IIIref#1#2#3{$^{\Inst{#1},\Inst{#2},\Inst{#3})}$}
\def\IIAref#1#2#3{$^{\Inst{#1},\Inst{#2},\mathrm{#3)}}$}
%%%%%%%%%%%% Annospec environment   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{Annospec}[1]{% Give width for offset of text
\vskip2mm\bgroup
%\def\@makefnmark{\hbox{$^{\mathrm{\@thefnmark)}}$}}
\long\def\@makefntext##1{\parindent=\z@
\begin{list}{}%
   {\labelwidth=#1\leftmargin\labelwidth% set global width
    \labelsep3pt%  horizontal separation between term and item
    \itemsep0pt%   vertical separation between two items
    \parsep0pt%    vertical separation two paragraphs in an item
    \topsep0pt%    vertical separation text/list
    \footnotesize}
    \item [\hfill $^{\mathrm{\@thefnmark)}}$] ##1\end{list}}}% ***** end of makefntext
{\egroup}% ***** end of environment{Annospec} *****
 
 
% End of titlepage
\def\endtitlepage{%% Reset counters
\setcounter{footnote}{0}\let\titlepage\relax\vfill
\newpage\setcounter{page}{1}\pagestyle{plain}\pagenumbering{arabic}%
\gdef\@thanks{}\gdef\@author{}\gdef\@title{}\let\thanks\relax}
 
% Calculate price for printing at end of document
\newcommand{\Prix}{%
    \newcount\C@centot \C@centot=\c@page\advance\C@centot by 2
    \multiply\C@centot by 5 % multiplication factor
    \newcount\C@francs \C@francs=\C@centot
    \divide\C@francs by 100 % francs
    \newcount\C@dummy \C@dummy=\C@francs
    \multiply\C@dummy by 100 % translate francs to centimes
    \advance\C@centot by -\C@dummy % remaining centimes (< 1 franc)
    \def\Price{\the\C@francs.\ifnum\C@centot<10 0\fi \the\C@centot}
\ifodd\c@page
  \newpage
  \thispagestyle{empty}
  \mbox{}
  \vfill
  \parindent0pt
  \raisebox{-15mm}[0pt][0pt]{\small\it Printed at CERN on acid-free paper,
price: \Price\ francs}
\else
  \vfill
  \hfill\raisebox{-15mm}[0pt][0pt]{\small\it Printed at CERN on acid-free paper,
price: \Price\ francs}
\fi
}
 
%\RequirePackage{subeqn}
%\RequirePackage{subeqnarray}
%\RequirePackage{subfigure}
 
% Local CERN stuff
 
\newcommand{\bra}[1]{\left\langle #1\right|} % <bra|
\newcommand{\ket}[1]{\left| #1\right\rangle} % |ket>
\newcommand{\braket}[2]{\left\langle#1 | #2\right\rangle} % <bra|ket>
 
\endinput
 
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
