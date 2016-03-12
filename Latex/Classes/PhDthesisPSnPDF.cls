% -*- root: ../../../thesis.tex -*-
%---------------------------------------------------------------
% PhDthesis version 3 style file by Holger Nahrstaedt, 2015, 2016
% based on PhDthesis version 2 style file by Jakob Suckale, 2007
% based on CUEDthesis version 1 by Harish Bhanderi 2002
%---------------------------------------------------------------


%-------------------------- identification ---------------------
%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Latex/Classes/PhDthesisPSnPDF}[2016/03/12 v3 PhD thesis class]


%:-------------------------- report or book -----------------------

%If you want to use a Report style document then uncomment the following 3 lines and comment the below 8 book style lines:
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
%\ProcessOptions\relax
%%\LoadClass[a4paper]{report}
%\ifx\pdfoutput\undefined
%   \LoadClass[dvips, a4paper]{report}
%\else
%   \LoadClass[pdftex, a4paper]{report}
%\fi

%%Bibliography
%%uncomment next line to change bibliography name to references for Report document class
%\renewcommand{\refname}{References}



%If you want to use a Book style document then uncomment the following 3 lines and comment the above 8 report style lines:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
%if you use a macTeX 2008 or later, use the ifpdf package
\RequirePackage{ifpdf} 

\ifpdf
    % we are running PDFLaTeX
    \message{pdfoutput detected}
   %\LoadClass[pdftex, a4paper]{book}
    \LoadClass[a4paper]{book}
   %:------------------------ Enable normal pdf generation --------------------
 
 %  \usepackage[pdftex]{hyperref}

  %:-------------------------- Enable pdfa-1b generation -----------------------
  \usepackage[a-1b]{pdfx}
  \usepackage{xmpincl}
  %\includexmp{pdfa-1b}
  %: ----------------------------------------------------------------------------
\else
    %DVI-output
  \LoadClass[dvips, a4paper]{book}
  \usepackage[
  dvips, 
  %bookmarks=true,
  %pdfpagelabels,
  %pagebackref,
  %hyperindex = true,
  %hyperfigures,
  pdfpagelayout = SinglePage,
  pdfpagemode = UseOutlines, 
  ]{hyperref}
    
\fi


% TeX default is 50
\hyphenpenalty=750
% The TeX default is 1000
\hbadness=1350
% IEEE does not use extra spacing after punctuation
\frenchspacing

\binoppenalty=1000 % default 700
\relpenalty=800     % default 500
   
\interfootnotelinepenalty=10000


%:-------------------------- packages UTF8 -----------------------
\usepackage{inputenc}
\inputencoding{utf8}
\makeatother
%:-------------------------  graphics ----------------------------
\usepackage{tikz}

%\usepackage{pgf}
\usepackage{tikzscale}
\usepackage{pgfplots}
\pgfplotsset{compat=1.12}
\usepgfplotslibrary{external} 
%\usetikzlibrary{arrows,pgfplots.groupplots,external}
\tikzexternalize[shell escape=-enable-write18, optimize=false]
\tikzset{external/system call= {pdflatex -save-size=80000 
                               -pool-size=10000000 
                               -extra-mem-top=50000000 
                               -extra-mem-bot=10000000 
                               -main-memory=90000000 
                               \tikzexternalcheckshellescape 
                               -halt-on-error 
                               -interaction=batchmode
                               -jobname "\image" "\texsource"}} 
\makeatletter
\newcommand{\useexternalfile}[2]{%
    \tikzsetnextfilename{#2-output}%
    \includegraphics[width=#1\textwidth]{\tikzexternal@filenameprefix#2.tikz}}
\makeatother

%\def\useexternalfile#1{\tikzsetnextfilename{#1-output}\input{\csname tikzexternal\endcsname#1.tikz}}

%\tikzexternalize[shell escape=-enable-write18]
\usepackage {asymptote}
\usepackage {catchfile}

\begingroup
\catcode `\^^M = 12 \endlinechar = -1 %
\global \def \IncludeAsymptoteFile #1%
     {\def \BeginAsy {\begin {asy}[width=0.95\columnwidth]}
      \def \DoAsy {\detokenize \expandafter {\AsymptoteFileContents}}
      \begingroup
             \lccode `\/ = `\\
             \lccode `\( = `\{
             \lccode `\) = `\}
             \lowercase {\gdef \EndAsy {^^M/end(asy)^^M}}
      \endgroup
      \CatchFileEdef \AsymptoteFileContents {#1} {\def \par {^^J}}
      \expandafter \expandafter \expandafter \BeginAsy \expandafter \DoAsy \EndAsy
     }
\endgroup


\begin{asydef}
texpreamble("\include{commands}");
texpreamble("\usepackage{libertine}");
texpreamble("\usepackage[libertine]{newtxmath}");
texpreamble("\usepackage[T1]{fontenc}");
texpreamble("\usepackage{amssymb}");
texpreamble("\usepackage{amsmath}");
texpreamble("\usepackage{mathtools}");
texpreamble("\usepackage{upgreek}");
\end{asydef}
%// Global Asymptote definitions can be put here.
%import three;
%usepackage("bm");
%texpreamble("\def\V#1{\bm{#1}}");
%// One can globally override the default toolbar settings here:
%// settings.toolbar=true;
%:-------------------------- packages for fancy things -----------------------
\usepackage{graphics} % for improved inclusion of graphics
%\usepackage{wrapfig} % to include figure with text wrapping around it
\usepackage[margin=10pt,font=small,labelfont=bf]{caption} % for improved layout of figure captions with extra margin, smaller font than text
\usepackage{fancyhdr} % for better header layout
\usepackage[german,english]{babel}
%\usepackage[usenames, dvipsnames]{color}
\usepackage[perpage]{footmisc}
\usepackage[sort, numbers]{natbib}
\usepackage{ifthen}
\usepackage{placeins}
\usepackage[countmax]{subfloat}
\usepackage{subfig}
\usepackage{multicol} % for pages with multiple text columns, e.g. References
\setlength{\columnsep}{20pt} % space between columns; default 10pt quite narrow
\usepackage[nottoc]{tocbibind} % correct page numbers for bib in TOC, nottoc suppresses an entry for TOC itself
%\usepackage{nextpage}
\usepackage{booktabs}
\usepackage{setspace}
\usepackage[figure,lined,boxed]{algorithm2e}
%\usepackage{showframe}
\usepackage{multirow}
\usepackage{hhline}
\usepackage{titlesec}

%:-------------------------- Math -------------------------------------------
%\usepackage{unicode-math}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{mathtools}
\usepackage{upgreek}
%\usepackage{eucal} %special alphabet

%:-------------------------- Fonts ------------------------------------------

\usepackage{marvosym} %Euro cur­rency sym­bol, male female symbol

%---http://www.khirevich.com/latex/font/
%\usepackage{charter}
%\usepackage[expert]{mathdesign}
%---
% mathtimes 
%\usepackage{times}
%\usepackage[mtbold,mtplusscr,mtpluscal,slantedgreek,T1]{mathtime}
%\usepackage[mtbold]{mathtime}
%\usepackage{bm}
% https://tug.org/pracjourn/2006-1/hartke/hartke.pdf
%\usepackage{cmbright}
%\usepackage{mathptmx}
%\usepackage[varg]{txfonts}
%Palatino text
%\usepackage{pxfonts}
%\usepackage{txfonts}
%\usepackage{fourier}
%\usepackage{gfsartemisia-euler}
%\usepackage[scaled=0.92]{helvet}  % set Helvetica as the sans-serif font
%\renewcommand{\rmdefault}{ptm}    % set Times as the default text font
%\usepackage[lite,subscriptcorrection,slantedGreek,nofontinfo]{mtpro2}
% -- bestOption
\usepackage{libertine}
\usepackage[libertine]{newtxmath}
\usepackage[T1]{fontenc}
% -- endBestoption
%:---- http://www.tug.dk/FontCatalogue/garamondx/

%\usepackage[urw-garamond]{mathdesign}
%\usepackage{garamondx}
%:--- tikz



%:-------------------------- Glossary/Abbrev./Symbols -----------------------

\usepackage[toc,acronym,nomain,indexonlyfirst]{glossaries}
\glsdisablehyper
\newglossary[slg]{symbolslist}{syi}{syg}{Symbols}
\usepackage{longtable}

%:-------------------------- PDF/PS setup -----------------------
% png or pfg/pdf graphics?
%\usepackage{pgf}
\usepackage{import}
\usepackage{chapterfolder}

\newif\ifusepng
\usepngfalse
%\usepngfalse
%\newboolean{usepng} %Deklaration
%\setboolean{usepng}{false} %Zuweisung

\newif\ifusepgf
\usepgftrue
%\usepgftrue
%\newboolean{usepgf} %Deklaration
%\setboolean{usepgf}{false} %Zuweisung



\ifpdf
%-->
%--> Google.com search "hyperref options"
%--> 
%--> http://www.ai.mit.edu/lab/sysadmin/latex/documentation/latex/hyperref/manual.pdf
%--> http://www.chemie.unibas.ch/~vogtp/LaTeX2PDFLaTeX.pdf 
%--> http://www.uni-giessen.de/partosch/eurotex99/ oberdiek/print/sli4a4col.pdf
%--> http://me.in-berlin.de/~miwie/tex-refs/html/latex-packages.html
%-->
    \hypersetup{ plainpages = false, 
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 colorlinks = false,  % was true
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = red,
                 anchorcolor = green,
                 %bookmarks=true,
                 %pdfpagelabels,
                 %pagebackref,
                 %hyperindex = true,
                 %hyperfigures,
                 pdfpagelayout = SinglePage,
                 pdfpagemode = UseOutlines, 
                 pdfencoding=unicode
}
%                 ]{hyperref} 

    \DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf, .gif} %GIF doesn't work??
    %\usepackage[pdftex]{graphicx}
%    \pdfcompresslevel=9
%    \pdfminorversion=5
%    \pdfobjcompresslevel=3
    \graphicspath{{0_frontmatter/figures/PNG/}{0_frontmatter/figures/PDF/}{0_frontmatter/figures/}}
\else
    \usepackage[ bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = red,
                 anchorcolor = green,
                 ]{hyperref}

    \DeclareGraphicsExtensions{.eps, .ps}
    \usepackage{epsfig}
    \usepackage{graphicx}
    \graphicspath{{0_frontmatter/figures/EPS/}{0_frontmatter/figures/}}
\fi


%:-------------------------- page layout -----------------------

%A4 settings
\ifpdf
   \pdfpageheight=297mm
   \pdfpagewidth=210mm
\else
   \setlength{\paperheight}{297mm}
   \setlength{\paperwidth}{210mm}
\fi

\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}

%: Uncomment this secion for two-sided printing
% ------------------------------
%\usepackage[left=4cm,right=3cm,top=3.2cm,bottom=3.8cm,includeheadfoot,includefoot]{geometry}
% \usepackage[  
%     vmarginratio=1:2, %Verhältnis der oben/unten Seitenränder zur automatischen Berechnung
%     paper=a4paper,
%     lmargin=4cm, % mittlerer Rand
%     rmargin=2cm, % äußerer Rand
%     marginparwidth=2.3cm, % Breite des Marginpars
%     includehead, % Kopfzeile in Berechnung einbeziehen
%     includemp % Marginpar in die Berechnung mit einbeziehen
% ]{geometry}
%\setlength{\marginparwidth}{2.3cm}
% \setlength{\oddsidemargin}{1.5cm}
% \setlength{\evensidemargin}{0cm}
% \setlength{\topmargin}{1mm}
% \setlength{\headheight}{1.36cm}
% \setlength{\headsep}{1.00cm}
% \setlength{\textheight}{20.84cm}
% \setlength{\textwidth}{14.5cm}
% \setlength{\marginparsep}{1mm}
% \setlength{\marginparwidth}{3cm}
% \setlength{\footskip}{2.36cm}

\setlength{\oddsidemargin}{1.5cm}
\setlength{\evensidemargin}{0cm}
\setlength{\topmargin}{-1cm}
\setlength{\headheight}{1.36cm}
\setlength{\headsep}{1.00cm}
\setlength{\textheight}{21.84cm}
\setlength{\textwidth}{14.5cm}
\setlength{\marginparsep}{1mm}
\setlength{\marginparwidth}{3cm}
\setlength{\footskip}{2.36cm}


%: Uncomment this secion for one-sided printing
% taken from the original file, but with the first two lanes modified
% ------------------------------
% \setlength{\evensidemargin}{1.9cm} % was 1.96cm in original
% \setlength{\oddsidemargin}{-0.001cm} % was -0.54cm in original file
% \setlength{\topmargin}{1mm}
% \setlength{\headheight}{1.36cm}
% \setlength{\headsep}{1.00cm}
% \setlength{\textheight}{20.84cm}
% \setlength{\textwidth}{14.5cm}
% \setlength{\marginparsep}{1mm}
% \setlength{\marginparwidth}{3cm}
% \setlength{\footskip}{2.36cm}


%: section below defines fancy page layout options
% ------------------------------
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. #1 }}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
\fancyhead[RO]{\bfseries\rightmark}
\fancyhead[LE]{\bfseries\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}



% \titleformat{\chapter}[display]
% {\bfseries\sffamily\Large}
% { %\Huge\textsc{\chaptertitlename}\sffamily
% \hfill\fontsize{80}{70}\selectfont\color{lightgray}\textbf{\thechapter}}
% {-2ex}
% {\filleft\fontsize{28}{49}\selectfont\scshape\baselineskip}
% [\vspace{-0ex}] 

\titleformat{\chapter}[display]
{\bfseries\sffamily\Huge}
{\hfill\fontsize{140}{50}\selectfont\color{lightgray}\rmfamily\textbf{\thechapter}}% label
{-0ex}
%{\filleft moves all to the right side
{\filleft\fontsize{50}{50}}
[\vspace{-0ex}]

%:-------------------------- title page layout -----------------------

% starts roman page numbering until chapter 1
% important to avoid two pages numbered 1 and 2 which may cause bad links
% bug: cover i + back side ii and then numbering restarts with i; should be iii
\renewcommand{\thepage}{\roman{page}}

%\newcommand{\submittedtext}{{Doktor der Ingenieurwissenschaften}}

% DECLARATIONS
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.
\makeatletter
% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your college or department(eg. Trinity, Pembroke, Maths, Physics)
\def\collegeordept#1{\gdef\@collegeordept{#1}}
% The name of your University
\def\university#1{\gdef\@university{#1}}
% Defining the crest
\def\crest#1{\gdef\@crest{#1}}
% Stating the city of birth for title page where needed; uncommented for use
\def\cityofbirth#1{\gdef\@cityofbirth{#1}}

\def\degreefull#1{\gdef\@degreefull{#1}}

\def\olddegree#1{\gdef\@olddegree{#1}}

\def\degreeplaceyear#1{\gdef\@degreeplaceyear{#1}}

\def\comiteehead#1{\gdef\@comiteehead{#1}}
\def\firstreviewer#1{\gdef\@firstreviewer{#1}}
\def\secondreviewer#1{\gdef\@secondreviewer{#1}}
\def\thirdreviewer#1{\gdef\@thirdreviewer{#1}}
\makeatother
% These macros define an environment for front matter that is always 
% single column even in a double-column document.
\makeatletter
\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}
\makeatother

%define title page layout
\makeatletter
\renewcommand{\maketitle}{%

\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
%  \null\vfill
  \begin{center}
  %{\large \vspace*{35mm} {{\@crest} \par} \vspace*{25mm}}
  %{\large \vspace*{-30mm} {{\@crest} \par}}
    { \Huge {\bfseries {\@title}} \par}\vspace*{15mm}
{\Large 
    {{vorgelegt von} \par}
    \vspace*{-1ex}
    {{\@olddegree} \par}
    \vspace*{-1ex}
    {{\@author} \par}
    \vspace*{-1ex}
    {aus {\@cityofbirth} \par}
	\vspace*{5mm}
%	{{\@cityofbirth} \par}    

	\vspace*{1ex}
    {{\@collegeordept} \par}
	\vspace*{-1ex}
    {{\@university} \par}
	\vspace*{-1ex}
    {{zur Erlangung des Akademischen Grades} \par}
    \vspace*{1ex}
    {{\@degreefull} \par}
	\vspace*{-1ex}
    { {\@degree} \par}
	\vspace*{1ex}
{{genehmigte Dissertation} \par}\vspace*{5mm}
}
 \end{center}
 {\large 
{{Promotionsausschuss:} \par}
{{Vorsitzender: {\@comiteehead}} \par}\vspace*{-1ex}
{{Gutachter: {\@firstreviewer}} \par}\vspace*{-1ex}
{{Gutachter: {\@secondreviewer}} \par}\vspace*{-1ex}
{{Gutachter: {\@thirdreviewer}} \par}
    {\@degreedate}
}%end large
   \begin{center}
    {\Large
    \vspace*{1ex}
    {{{\@degreeplaceyear} \\D 83}}
    }
   \end{center}
  \null\vfill

\end{alwayssingle}}
\makeatother

% page number for cover back side should have page number blanked


%:-------------------------- front matter layout -----------------------

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{quote} \begin{center}}
{\end{center} \end{quote} \end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\pagestyle{empty}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\pagestyle{empty}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}\begin{quote}}
{\end{quote}\end{alwayssingle}}

%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{abstracts} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractslong} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm} \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately
\makeatletter
\newenvironment{abstractseparate} {\begin{alwayssingle} \pagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
    {{\@university} \par}
\vspace*{1ex}
    {{\it \@submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}
\makeatother
%Statement of originality if required

\newenvironment{declaration} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Declaration}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}
%Deutsche Zusammenfassung
\newenvironment{zusammenfassung} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Zusammenfassung}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}


%:-------------------------- page numbers: roman+arabic -----------------------

% ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

%\newenvironment{romanpages}
%{
%	\setcounter{page}{1}
%	\renewcommand{\thepage}{\roman{page}}
%} % close romanpage env't
 
{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

%\DeclareMathVersion{mathchartertext}
%\SetSymbolFont{letters}{mathchartertext}{OML}{mdbch}{m}{n}
%\newcommand{\gchar}[1]{\mathversion{mathchartertext}$#1$\mathversion{normal}}
\newcommand{\gchar}[1]{$#1$}