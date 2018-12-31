\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mmuthesis}[2011/07/07 LaTeX2e class for MMU Thesis v1.1.  Copyright (c) 2011 Lim Lian Tze (liantze@gmail.com)]

\LoadClass[12pt,a4paper,oneside, openany]{memoir}
\RequirePackage{textcomp}

%%%%%%%%%%%%
% Page layout
%
% Margins: T - 20mm; B - 40mm; L - 40mm; R - 25mm
% No running headers.
% Running footers are 15mm from bottom edge of paper
% i.e. (40 - 15)mm = 25mm from bottom edge of typeblock.
%%%%%%%%%%%%
\settrimmedsize{297mm}{210mm}{*}
\setlrmarginsandblock{40mm}{25mm}{*}
\setulmarginsandblock{20mm}{40mm}{*}
\setheadfoot{\baselineskip}{25mm}
\addtolength\footskip{-6pt}
\pagestyle{plain}
\makeevenfoot{plain}{}{\fontsize{10pt}{12pt}\selectfont\thepage}{}
\makeoddfoot{plain}{}{\fontsize{10pt}{12pt}\selectfont\thepage}{}
\checkandfixthelayout

%%%%%%%%%%%%
% Simulate MS Windows fonts
% Invoking Helvetica and Times
% NOT Courier because, well, I hate it.
%
% TODO: TeX Gyre fonts + Math Times Pro with "altfonts" option
%%%%%%%%%%%%
\RequirePackage[T1]{fontenc}
\RequirePackage{helvet}
\RequirePackage{mathptmx}
\RequirePackage{courier}
\renewcommand\ttdefault{lmvtt}


%%%%%%%%%%%%
% Line and paragraph spacing
% - 1.5 spacing for normal text (but need to tweak to exactly simulate Word
% - Leave one line between paragraphs
% - 12.7mm paragraph indent
%%%%%%%%%%%%
%\OnehalfSpacing
\DisemulatePackage{setspace}
\RequirePackage{setspace}
\setstretch{1.5}
\abnormalparskip{1.5\onelineskip}
\setlength\parindent{12.7mm}
\RequirePackage{etoolbox}
\patchcmd{\quote}{\rightmargin}{\leftmargin 20mm \rightmargin}{}{}
\patchcmd{\quotation}{\rightmargin}{\leftmargin 20mm \rightmargin}{}{}

%%%%%%%%%%%%
% Footnotes
% - Font size = 8pt = \tiny for 12pt body font in memoir
% - Double spacing between footnotes
%%%%%%%%%%%%
\renewcommand{\foottextfont}{\tiny}
\setlength\footnotesep{\onelineskip}
% But they should all be endnotes!!
\RequirePackage{endnotes}
\renewcommand\enotesize{\tiny}
%\let\footnote=\endnote
\renewcommand\enoteheading{\chapter{\notesname}\mbox{}\vskip-4\onelineskip}
\renewcommand\enoteformat{\rightskip\z@ \leftskip\z@ \parindent=1.8em
  \leavevmode\llap{\makebox[1.8em][l]{\theenmark.}}}

%%%%%%%%%%%%%
% Algorithms
%%%%%%%%%%%%%
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{caption}
\DeclareCaptionFormat{algorithm}{\vspace{0ex}{%
   \parbox[c][1.75em][c]{\textwidth}{#1#2\hspace{1em}#3}}\par}%\rule{\linewidth}{0.5pt}}
\captionsetup[algorithm]{format=algorithm}
\captionsetup[figure]{font=bf}
\captionsetup[table]{font=bf,position=top}

\AtBeginEnvironment{algorithmic}{\setstretch{1.5}}

\RequirePackage[breaklinks,pdfborder={0 0 0},bookmarksopen,bookmarksnumbered,pdfprintscaling=None]{hyperref}
\addtoiargdef\author{}{\hypersetup{pdfauthor={\theauthor}}}
\addtoiargdef\title{}{\hypersetup{pdftitle={\thetitle}}}


%%%%%%%%%%%%
% 10pt = \footnotesize for backmatter
% And add a PDF bookmark
%%%%%%%%%%more (at least, I don't get one once I delete it).%%
\cftinsertcode{narrowertoc}{\setlength\cftbeforechapterskip{.75em}}

\patchcommand{\backmatter}{}{\footnotesize%
\cftinserthook{toc}{narrowertoc}%
\renewcommand\chapter{\@ifstar{\mystarchap}{\mychap}}
\ifpdf\pdfbookmark[-1]{Back Matter}{back}\fi}
\patchcommand{\frontmatter}{}{\ifpdf\pdfbookmark[-1]{Front Matter}{front}\fi}
\patchcommand{\mainmatter}{}{\ifpdf\pdfbookmark[-1]{Main Chapters}{main}\fi}




%%%%%%%%%%%%
% Chapter headings
%%%%%%%%%%%%
\renewcommand\chapterheadstart{\normalsize\vskip\beforechapskip}
\setlength\beforechapskip{0pt}
\setlength\midchapskip{2\onelineskip}
\setlength\afterchapskip{2\onelineskip minus \onelineskip}
\renewcommand*\chapnamefont{\normalsize\bfseries}
\renewcommand*\chapnumfont{\normalsize\bfseries\centering}
\renewcommand*\chaptitlefont{\normalsize\bfseries\centering}
\renewcommand{\printchaptername}{{\chapnamefont\MakeUppercase{\chaptername}}}
\renewcommand*{\afterchapternum}{\vskip\midchapskip}
\renewcommand*{\printchaptertitle}[1]{{\chaptitlefont\MakeUppercase{#1}\par}}


%%%%%%%%%%%%
% Sectional headings
%%%%%%%%%%%%
\setsecnumdepth{subsubsection}
\setsecheadstyle{\normalsize\bfseries}
%\setbeforesecskip{2.5ex plus 1ex minus .2ex}
\setbeforesecskip{\onelineskip}
%\setaftersecskip{0.1ex plus .2ex}
%\setaftersecskip{1em plus .2ex minus .2ex}
\setaftersecskip{\onelineskip}
\setsubsecheadstyle{\normalsize\bfseries}
%\setbeforesubsecskip{2.5ex plus .1ex minus .2ex}
\setbeforesubsecskip{\onelineskip}
%\setaftersubsecskip{0.1ex plus .2ex}
%\setaftersubsecskip{1em plus .2ex minus .2ex}
\setaftersubsecskip{\onelineskip}
\setsubsubsecheadstyle{\normalsize\itshape}
%\setbeforesubsubsecskip{1.5ex plus 1ex minus .2ex}
\setbeforesubsubsecskip{\onelineskip}
\renewcommand\thesubsubsection{\thesubsection\space(\alph{subsubsection})}
\setsubsubsecheadstyle{\normalDevelop Your Android app in a modern way — Google I/O ’18 tipssize\itshape}
%\setbeforesubsubsecskip{2.5ex plus .2ex minus .2ex}
\setbeforesubsubsecskip{\onelineskip}
%\setaftersubsubsecskip{0.1ex plus .2ex}
%\setaftersubsubsecskip{1em plus .1ex minus .2ex}
\setaftersubsubsecskip{\onelineskip}


%%%%%%%%%%%
% ToC etc
%%%%%%%%%%%
\newsubfloat{figure}
\setcounter{lofdepth}{3}
\setcounter{secnumdepth}{3}
\newsubfloat{table}
\setcounter{lotdepth}{3}
\settocdepth{subsubsection}
\renewcommand*\contentsname{\texorpdfstring{TABLE OF CONTENTS}{Table of Contents}}
\renewcommand*\listtablename{\texorpdfstring{LIST OF TABLES}{List of Tables}}
\renewcommand*\listfigurename{\texorpdfstring{LIST OF FIGURES}{List of Figures}}
\renewcommand*\indexname{\texorpdfstring{INDEX}{Index}}
\renewcommand*\glossaryname{\texorpdfstring{GLOSSARY}{Glossary}}
\renewcommand\cftdotsep{\cftnodots}
\setrmarg{3.55em plus 1fil}
\renewcommand*{\cftchaptername}{\MakeUppercase{\chaptername}\space}
\renewcommand*{\cftchapteraftersnum}{:\space}
\renewcommand*{\cftchapterafterpnum}{\vspace*{4pt}}
\renewcommand*{\cftappendixname}{\MakeUppercase{\appendixname}\space}
\setlength\cftsectionindent{0pt}
\let\orichapter\chapter
\renewcommand\chapter{\@ifstar{\mystarchap}{\mychap}}
\newcommand\mychap[1]{\orichapter[\texorpdfstring{\MakeUppercase{#1}}{#1}]{#1}}
\newcommand\mystarchap[1]{\orichapter*{#1}}
%\renewcommand*\cftsectionafterpnum{\vskip 3pt}
\setlength\cftbeforesectionskip{3pt}
\setlength\cftbeforechapterskip{1.5em}
\setlength\cftsubsectionindent{\cftsectionnumwidth}
\renewcommand*\cftfigurename{\figurename\space}
\newlength\fignamelength
\settowidth\fignamelength{\cftfigurename}
\setlength\cftsubfigureindent{\fignamelength}
\setlength\cftsubfigurenumwidth{2em}
%\renewcommand*\cftfigureafterpnum{\vskip 3pt}
\setlength\cftbeforefigureskip{3pt}
%\renewcommand*\cftsubfigureafterpnum{\vskip 3pt}
\setlength\cftbeforesubfigureskip{3pt}
\renewcommand*\cfttablename{\tablename\space}
\newlength\tabnamelength
\settowidth\tabnamelength{\cfttablename}
\setlength\cftsubtableindent{\tabnamelength}
%\renewcommand*\cfttableafterpnum{\vskip 3pt}
\setlength\cftbeforetableskip{3pt}
%\renewcommand*\cftsubtableafterpnum{\vskip 3pt}
\setlength\cftbeforesubtableskip{3pt}

\addtodef{\insertchapterspace}{}%
{\addtocontents{toc}{\protect\vspace*{-4pt}}}

%%%%%%%%%%%
% Indexing
%%%%%%%%%%%
\RequirePackage{makeidx}
\RequirePackage[notesep=.5\onelineskip]{idxlayout}
\setindexprenote{}
\makeindex

%%%%%%%%%%%%
% Bibliograpy
% - Font size = 10pt = \footnotesize
% - Double spacing between entries
%%%%%%%%%%%%
\RequirePackage[nosectionbib]{apacite}
% new counter for enumerating bibitems
\newcounter{lbibcount} 
\bibliographystyle{apacite}
\renewcommand\bibliographytypesize{\footnotesize}
\setlength\bibitemsep{\onelineskip}
%\setlength\bibleftmargin{12.7mm}
\setlength\bibleftmargin{2em}
\setlength\bibindent{-\bibleftmargin}
% Add a counter label to each bibitem per MMU's requirement
\def\@lbibitem[#1]#2{%
    \def\BBA{\BBAA}%    ``\&''
    \item[\hyper@natanchorstart{#2\APAC@extra@b@citeb}%
          \@biblabel{#1}{\protect\makebox[\bibleftmargin][l]{[\arabic{lbibcount}]}}% added numeric label here
          \hyper@natanchorend]%
    \if@filesw{%
        \def\BBA{\string\BBA}%
        \let\protect\noexpand
        \immediate\write\@newciteauxhandle{\string\bibcite{#2}{#1}}%
        \immediate\write\@newciteauxhandle{\string\APACbibcite{#2}{#1}}%
        \def\BBA{\BBAA}%
    }%
    \fi
    \ignorespaces
}
% step counter at each bibitem
\patchcommand{\bibitem}{\addtocounter{lbibcount}{1}}{}
% reset label width to 0 and reset bibitem counter.
\addtoiargdef{\thebibliography}{}{\setcounter{lbibcount}{0}\labelwidth=0pt}
\renewcommand{\bibliographyprenote}{\vspace*{-\onelineskip}} % Ugly, ugly hack
\AtBeginDocument{\renewcommand*\bibname{\texorpdfstring{REFERENCES}{References}}}

\RequirePackage{multibib}


\newcites{jour,conf}{Journal Articles,Conference Proceedings}
\bibliographystylejour{apacite}
\bibliographystyleconf{apacite}
\newcommand\ownpubs{%
\settocdepth{chapter}
\chapter{Publication List}
\undef\chapter
}

%\RequirePackage{relsize}
\RequirePackage[toc,nonumberlist,description,shortcuts]{glossaries}
\renewcommand*{\acrnameformat}[2]{#2 (\acronymfont{#1})}
\renewcommand{\glsgroupskip}{}
\renewcommand{\glossarypreamble}{\footnotesize\vspace*{-\onelineskip}}
\renewcommand{\glossarypostamble}{\normalsize}
\makeglossaries

%%%%%%%%%%%%
% Floats
%%%%%%%%%%%%
\setlength{\intextsep}{2\onelineskip}
\setlength{\textfloatsep}{2\onelineskip}
\setlength{\floatsep}{2\onelineskip}

\AtEndDocument{\clearpage\hspace{1em}\thispagestyle{empty}\clearpage}
