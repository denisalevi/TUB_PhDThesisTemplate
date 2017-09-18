% -*- root: ../thesis.tex -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                            %%
%% Class ``PhD Thesis TUB''                                                   %%
%%                                                                            %%
%% A PhD thesis LaTeX template for the Technical University of Berlin         %%
%%                                                                            %%
%% Version: v3.2.0                                                            %%
%% Authors: Krishna Kumar                                                     %%
%% License: MIT License (c) 2017 Holger Nahrstaedt                            %%
%% GitHub Repo: https://github.com/holgern/TUB_PhDThesisTemplate              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------------------------------------------------
% PhDthesis version 3 style file by Holger Nahrstaedt, 2015 - 2017
% based on PhDthesis version 2 style file by Jakob Suckale, 2007
% based on CUEDthesis version 1 by Harish Bhanderi 2002
%---------------------------------------------------------------

% ************************** Class Identification ******************************
\newcommand\fileversion{3.2.0}
\newcommand\filedate{2017/09/15}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PhDthesisTUB}[\filedate\space PhD thesis class
 by Holger Nahrstaedt (v\fileversion)]
\typeout{https://github.com/holgern/TUB_PhDThesisTemplate}

% class option conditionals

\newif\ifCLASSOPTIONoneside         \CLASSOPTIONonesidetrue
\newif\ifCLASSOPTIONtwoside         \CLASSOPTIONtwosidetrue

\newif\ifCLASSOPTIONfinal           \CLASSOPTIONfinaltrue
\newif\ifCLASSOPTIONdraft           \CLASSOPTIONdraftfalse
\newif\ifCLASSOPTIONprint           \CLASSOPTIONprintfalse
\newif\ifCLASSOPTIONonline          \CLASSOPTIONonlinetrue

\newif\ifCLASSOPTIONnofonttune      \CLASSOPTIONnofonttunefalse

\newif\ifCLASSOPTIONcaptionsoff     \CLASSOPTIONcaptionsofffalse

\newif\ifCLASSOPTIONromanappendices \CLASSOPTIONromanappendicesfalse

% indicates if pdf (via pdflatex) output
\newif\ifCLASSINFOpdf               \CLASSINFOpdffalse

\newif\ifCLASSINFOfontA             \CLASSINFOfontAfalse
\newif\ifCLASSINFOfontB             \CLASSINFOfontBfalse
\newif\ifCLASSINFOfontC             \CLASSINFOfontCfalse
\newif\ifCLASSINFOfontD             \CLASSINFOfontDfalse
\newif\ifCLASSINFOfontE             \CLASSINFOfontEfalse
\newif\ifCLASSINFOfontF             \CLASSINFOfontFfalse
\newif\ifCLASSINFOfontG             \CLASSINFOfontGfalse
\newif\ifCLASSINFOfontH             \CLASSINFOfontHfalse
\newif\ifCLASSINFOfontI             \CLASSINFOfontIfalse
\newif\ifCLASSINFOfontJ             \CLASSINFOfontJfalse
\newif\ifCLASSINFOfontK             \CLASSINFOfontKfalse
\newif\ifCLASSINFOfontL             \CLASSINFOfontLfalse
\newif\ifCLASSINFOfontM             \CLASSINFOfontMfalse
\newif\ifCLASSINFOfontN             \CLASSINFOfontNfalse
\newif\ifCLASSINFOfontO             \CLASSINFOfontOfalse
\newif\ifCLASSINFOfontP             \CLASSINFOfontPfalse
\newif\ifCLASSINFOfontQ             \CLASSINFOfontQfalse
\newif\ifCLASSINFOfontR             \CLASSINFOfontRfalse
\newif\ifCLASSINFOfontS             \CLASSINFOfontSfalse
\newif\ifCLASSINFOfontT             \CLASSINFOfontTfalse
\newif\ifCLASSINFOfontU             \CLASSINFOfontUfalse
\newif\ifCLASSINFOfontV             \CLASSINFOfontVfalse
\newif\ifCLASSINFOfontW             \CLASSINFOfontWfalse
\newif\ifCLASSINFOfontX             \CLASSINFOfontXfalse
\newif\ifCLASSINFOfontY             \CLASSINFOfontYfalse
\newif\ifCLASSINFOfontZ             \CLASSINFOfontZfalse

%STIX
%palatino

%cambria
%pagella
%marion 

%helvetia
%chancery
%newcent
%courier
%bookman
%cmbright

\newif\ifCLASSINFOsetfont             \CLASSINFOsetfontfalse
\newif\ifCLASSINFOsetcustomfont             \CLASSINFOsetcustomfontfalse

\newif\ifCLASSINFOpdfaone               \CLASSINFOpdfaonefalse
\newif\ifCLASSINFOpdfatwo               \CLASSINFOpdfatwofalse
\newif\ifCLASSINFOpdfxthree             \CLASSINFOpdfxthreefalse
\newif\ifCLASSINFOpdfax                 \CLASSINFOpdfaxfalse

\newif\ifCLASSINFObiblatex                 \CLASSINFObiblatexfalse

\newif\ifCLASSINFOcustommargin             \CLASSINFOcustommarginfalse

% LaTeX does not support 9pt, so we set \@ptsize to 0 - same as that of 10pt
\DeclareOption{9pt}{\PassOptionsToClass{9pt}{book}\def\CLASSOPTIONpt{9}}
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{book}\def\CLASSOPTIONpt{10}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}\def\CLASSOPTIONpt{11}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}\def\CLASSOPTIONpt{12}}

\DeclareOption{letterpaper}{\setlength{\paperheight}{11in}%
                            \setlength{\paperwidth}{8.5in}%
                            \PassOptionsToClass{letterpaper}{book}
                            \def\CLASSOPTIONpaper{letterpaper}%
                            \def\CLASSINFOpaperwidth{8.5in}%
                            \def\CLASSINFOpaperheight{11in}}


\DeclareOption{a4paper}{\setlength{\paperheight}{297mm}%
                        \setlength{\paperwidth}{210mm}%
                        \PassOptionsToClass{a4paper}{book}
                        \def\CLASSOPTIONpaper{a4paper}%
                        \def\CLASSINFOpaperwidth{210mm}%
                        \def\CLASSINFOpaperheight{297mm}}

\DeclareOption{a5paper}{\setlength{\paperheight}{210mm}%
                        \setlength{\paperwidth}{148mm}%
                        \PassOptionsToClass{a5paper}{book}
                        \def\CLASSOPTIONpaper{a5paper}%
                        \def\CLASSINFOpaperwidth{148mm}%
                        \def\CLASSINFOpaperheight{210mm}}


\DeclareOption{oneside}{\PassOptionsToClass{oneside}{book}\@twosidefalse\@mparswitchfalse
                        \CLASSOPTIONonesidetrue\CLASSOPTIONtwosidefalse}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{book}\@twosidetrue\@mparswitchtrue
                        \CLASSOPTIONtwosidetrue\CLASSOPTIONonesidefalse}
\DeclareOption{print}{ \CLASSOPTIONprinttrue\CLASSOPTIONonlinefalse}
\DeclareOption{online}{\CLASSOPTIONprintfalse\CLASSOPTIONonlinetrue}

\DeclareOption{pdfa1}{\CLASSINFOpdfaonetrue\CLASSINFOpdfxthreefalse\CLASSINFOpdfatwofalse\CLASSINFOpdfaxtrue}
\DeclareOption{pdfx3}{\CLASSINFOpdfxthreetrue\CLASSINFOpdfaonefalse\CLASSINFOpdfatwofalse\CLASSINFOpdfaxtrue}
\DeclareOption{pdfa2}{\CLASSINFOpdfatwotrue\CLASSINFOpdfaonefalse\CLASSINFOpdfxthreefalse\CLASSINFOpdfaxtrue}

\DeclareOption{biblatex}{\CLASSINFObiblatextrue}

\newif\ifCLASSINFOsetsecondfont             \CLASSINFOsetsecondfontfalse

\DeclareOption{fontA}{
  \ifCLASSINFOsetfont
    \CLASSINFOsetsecondfonttrue

  \else
    \CLASSINFOfontAtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontB}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontBtrue
    \CLASSINFOsetfonttrue
  \fi
}

\DeclareOption{fontC}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontCtrue
    \CLASSINFOsetfonttrue
  \fi
}

\DeclareOption{fontD}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontDtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontE}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontEtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontF}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontFtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontG}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontGtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontH}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontHtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontI}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontItrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontJ}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontJtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontK}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontKtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontL}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontLtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontM}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontMtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontN}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontNtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontO}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontOtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontP}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontPtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontQ}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontQtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontR}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontRtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontS}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontStrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontT}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontTtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontU}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontUtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontV}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontVtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontW}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontWtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontX}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontXtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontY}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontYtrue
    \CLASSINFOsetfonttrue
  \fi
}
\DeclareOption{fontZ}{
  \ifCLASSINFOsetfont
\CLASSINFOsetsecondfonttrue
  \else
    \CLASSINFOfontZtrue
    \CLASSINFOsetfonttrue
  \fi
}

\ifCLASSINFOsetsecondfont
      \ClassWarning{PhDthesisTUB}{Font selection conflict: A font package was
      aleady specified. Please check the document class options in case you 
      have defined two fonts.}
\fi

\DeclareOption{customfont}{
  \ifCLASSINFOsetfont
    \ClassWarning{PhDthesisTUB}{Font selection conflict: A font package was
      aleady specified. Please check the document class options in case you 
      have defined two fonts.}
  \else
    \CLASSINFOsetcustomfonttrue
    \CLASSINFOsetfonttrue
  \fi
}



% ***************************** Custom Margins  ********************************
\DeclareOption{custommargin}{\CLASSINFOcustommargintrue}

% **************************** Separate Abstract  ******************************
\newif \ifdefineAbstract\defineAbstractfalse %To enable Separate abstract

\newif\ifCLASSINFOabstract\CLASSINFOabstractfalse % Enable Separate Abstract
\DeclareOption{abstract}{
  \CLASSINFOabstracttrue
  \ClassWarning{PhDthesisTUB}{You have chosen an option that generates only
    the Title page and an abstract with PhD title and author name, if this was
    intentional, ignore this warning. Congratulations on submitting your thesis!
    If not, please remove the option `abstract' from the document class and
    recompile. Good luck with your writing!}
  \PassOptionsToClass{oneside}{book}
}


%If you want to use a Book style document then uncomment the following 3 lines and comment the above 8 report style lines:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

% ************************* Conditional Statements *****************************
\RequirePackage{ifthen}   % Conditional statements
\RequirePackage{ifpdf}    % Check for pdfLaTeX
\RequirePackage{ifxetex}  % XeLaTeX
\RequirePackage{ifluatex} %luatex
\usepackage{etoolbox}
\RequirePackage{needspace}

%if you use a macTeX 2008 or later, use the ifpdf package
\RequirePackage{setspace} % Define line spacing in paragraph
\newif\ifsetDVI\setDVIfalse
\newif\ifXeOrLua\XeOrLuafalse

\ifluatex
\setDVIfalse
\XeOrLuatrue
\else %luatex
\ifxetex
\CLASSINFObiblatextrue
\setDVIfalse
\XeOrLuatrue
\else %xetex
\ifx\pdfoutput\undefined
  % we are not running PDFLaTeX
  \setDVItrue
  \else
    \ifnum \pdfoutput>0
    %PDF-Output
    \setDVIfalse
    \else
    %DVI-output
    \setDVItrue
  \fi 
\fi %dvi
\fi %xetex
\fi %luatex

\ifsetDVI
  % we are not running PDFLaTeX
  \LoadClass[dvips,fleqn,openright]{book}%
\else % we are running PDFLaTeX

    \LoadClass[fleqn,openright]{book}%

      %:-------------------------- Enable pdfa-1b generation -----------------------
    \ifCLASSINFOpdfaone
      \let\tmpa\textsuperscript
      \DeclareTextCommandDefault{\textsuperscript}{\tmpa}
      \RequirePackage[a-1b]{pdfx}
      %\RequirePackage[x-3]{pdfx}
      \RequirePackage{xmpincl}
      %\includexmp{pdfa-1b}
    \else
           \ifCLASSINFOpdfxthree
               \let\tmpa\textsuperscript
               \DeclareTextCommandDefault{\textsuperscript}{\tmpa}
              %\RequirePackage[a-1b]{pdfx}
              \RequirePackage[x-3]{pdfx}
              \RequirePackage{xmpincl}
               %\includexmp{pdfa-1b}
           \else
              \ifCLASSINFOpdfatwo
                 \let\tmpa\textsuperscript
                 \DeclareTextCommandDefault{\textsuperscript}{\tmpa}
                \RequirePackage[a-2b]{pdfx}
                %\RequirePackage[x-3]{pdfx}
                \RequirePackage{xmpincl}
                 %\includexmp{pdfa-1b}
            \else
        
            \fi %a2
          \fi %x3
    \fi %a1
    \fi
  %: ----------------------------------------------------------------------------


% ******************************************************************************
% ******************************** Packages ************************************
% ******************************************************************************
% ************************** Layout and Formatting *****************************

\RequirePackage{lscape}   % Supports Landscape Layout

\RequirePackage{calc}     % calculate vertical spacing
\RequirePackage{tabularx}

% print bookmark for the table of contents
\makeatletter
\pretocmd{\tableofcontents}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \pdfbookmark[0]{Table of contents}{toc}%
}{}{}%
\makeatother

% *************************** Graphics and Figures *****************************
%\RequirePackage[usenames, dvipsnames]{color}
\ifpdf
  % Convert eps figures to pdf
  \RequirePackage{epstopdf}
  \RequirePackage[pdftex]{graphicx}
  \usepackage{pstricks}    %for embedding pspicture.
%\usepackage[pdftex]{graphicx}    %for figure environment.
%\RequirePackage{svg}
      \DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf, .gif} %GIF doesn't work??
    %\RequirePackage[pdftex]{graphicx}
%    \pdfcompresslevel=9
% forcing PDF v1.4 ensured compatibility
%    \pdfminorversion=4
%    \pdfobjcompresslevel=3
    \graphicspath{{0_frontmatter/figures/PNG/}{0_frontmatter/figures/PDF/}{0_frontmatter/figures/}}
\else
     \DeclareGraphicsExtensions{.eps, .ps}
    \RequirePackage{epsfig}
    \RequirePackage{graphicx}
    \graphicspath{{0_frontmatter/figures/EPS/}{0_frontmatter/figures/}}
\fi





%:-------------------------  graphics ----------------------------
\RequirePackage{tikz}

%\RequirePackage{pgf}
\RequirePackage{tikzscale}
%\usepackage{pstricks}
%\usepackage{auto-pst-pdf}
\usetikzlibrary{shapes,arrows}
% needed for BB
\usetikzlibrary{calc}

\RequirePackage{pgfplots}
\pgfplotsset{compat=1.9}
\usepgfplotslibrary{external} 
%\usetikzlibrary{arrows,pgfplots.groupplots,external}
\usetikzlibrary{external}

% create the tikz every run
\tikzexternalize[shell escape=-enable-write18,  optimize=false]
% check and run only the changed ones
%\tikzexternalize[shell escape=-enable-write18,  optimize=false,mode=list and make]

\ifluatex
\tikzset{external/system call={lualatex 
\tikzexternalcheckshellescape -halt-on-error -interaction=batchmode
                              -jobname "\image" "\texsource"}}
\else
\ifxetex
\tikzset{external/system call={xelatex
\tikzexternalcheckshellescape -save-size=80000 
                               -pool-size=10000000 
                               -extra-mem-top=50000000 
                               -extra-mem-bot=10000000 
                               -main-memory=90000000 
                               -halt-on-error -interaction=batchmode
                               -jobname "\image" "\texsource"}}
\else
%\tikzexternalize[shell escape=-shell-escape,  optimize=false]
\tikzset{external/system call= {pdflatex \tikzexternalcheckshellescape  -save-size=80000 
                               -pool-size=10000000 
                               -extra-mem-top=50000000 
                               -extra-mem-bot=10000000 
                               -main-memory=90000000 
                               -halt-on-error 
                               -interaction=batchmode
                               -jobname "\image" "\texsource"}} 
\fi
\fi
\makeatletter
\newcommand{\useexternalfile}[2]{%
    \tikzsetnextfilename{#2-output}%
    \includegraphics[width=#1\textwidth]{\tikzexternal@filenameprefix#2.tikz}}
\makeatother

%\def\useexternalfile#1{\tikzsetnextfilename{#1-output}\input{\csname tikzexternal\endcsname#1.tikz}}

%\tikzexternalize[shell escape=-enable-write18]

%:-------------------------- packages for fancy things -----------------------
\RequirePackage{graphics} % for improved inclusion of graphics
%\RequirePackage{wrapfig} % to include figure with text wrapping around it
\RequirePackage[margin=10pt,font=small,labelfont=bf]{caption} % for improved layout of figure captions with extra margin, smaller font than text
%\RequirePackage{fancyhdr} % for better header layout
\RequirePackage[german,english]{babel}
%\RequirePackage[usenames, dvipsnames]{color}
%\RequirePackage[perpage]{footmisc}

\RequirePackage{placeins}
\RequirePackage[countmax]{subfloat}
\RequirePackage{subfig}
\RequirePackage{multicol} % for pages with multiple text columns, e.g. References
\setlength{\columnsep}{20pt} % space between columns; default 10pt quite narrow
\RequirePackage[nottoc]{tocbibind} % correct page numbers for bib in TOC, nottoc suppresses an entry for TOC itself
% Add appendices
\RequirePackage[title,titletoc]{appendix}
%\RequirePackage{nextpage}
\RequirePackage{booktabs}

\RequirePackage{ntheorem}
\newtheorem{theorem}{Theorem}


\usepackage{algorithm}% http://ctan.org/pkg/algorithms
\usepackage{algpseudocode}% http://ctan.org/pkg/algorithmicx

%\RequirePackage{regexpatch}

%\RequirePackage{showframe}
\RequirePackage{multirow}
\RequirePackage{hhline}
\RequirePackage{titlesec}
\RequirePackage[separate-uncertainty = true,multi-part-units=single]{siunitx}
\sisetup{
  locale = US ,
  per-mode = symbol,
  binary-units = true
}
  \RequirePackage{amsmath}
  \RequirePackage{amssymb}
  \RequirePackage{mathtools}
   \RequirePackage{upgreek}
   \RequirePackage{amsfonts}
% ********************************** Fonts **********************************
\RequirePackage{anyfontsize}
% Font Selection
\ifXeOrLua
  \usepackage{fontspec}
   \usepackage[warnings-off={mathtools-colon}]{unicode-math}
\else
  \RequirePackage[utf8]{inputenc}
  %\inputencoding{utf8}
  \RequirePackage[T1]{fontenc}
\fi


\ifCLASSINFOfontA
  \ifXeOrLua
    \setmainfont[Numbers={OldStyle},Ligatures={TeX, Common%, Historic, Contextual, Rare, Discretionary 
    }]{XITS}
    \setmathfont{XITS Math}
  \else
    \usepackage{newtxtext,newtxmath}  % times roman, including math (where possible)
  \fi
  \message{PhDthesisTUB: Using font A}
\else
\fi

\ifCLASSINFOfontB
  \ifXeOrLua
    \setmainfont[Numbers={OldStyle,Proportional},Ligatures={TeX, Common%, Historic, Contextual, Rare, Discretionary 
    }]{Cambria}
    \setsansfont{Calibri}
    \setmathrm{Cambria Math}
    \setmonofont{Consolas}
  \else
     \RequirePackage{cmbright} % Fourier  % times roman, including math (where possible)
  \fi
    \message{PhDthesisTUB: font B}
 \else
 \fi
 
 \ifCLASSINFOfontC
 \ifluatex

    \setmainfont[Numbers={OldStyle,Proportional},Ligatures={TeX, Common%, Historic, Contextual, Rare, Discretionary 
    }]{Libertinus Serif} 
    \setmonofont[Scale=0.8]{Libertinus Mono} 
    \setsansfont{Libertinus Sans} 
    \setmathfont{Libertinus Math}

  \else
  \ifxetex
    \setmainfont[Numbers={OldStyle,Proportional},Ligatures={TeX, Common%, Historic, Contextual, Rare, Discretionary 
    }]{Libertinus Serif} 
    \setmonofont[Mapping=tex-text,Scale=0.8]{Libertinus Mono} 
    \setsansfont[Mapping=tex-text]{Libertinus Sans} 
    \setmathfont[AutoFakeBold]{Libertinus Math}

  \else % pdflatex
      \RequirePackage[mono=false]{libertine}
    \RequirePackage[libertine]{newtxmath}
  \fi
   \fi
    \message{PhDthesisTUB: Using Font C }
 \else
 \fi

\ifCLASSINFOfontD
  \ifXeOrLua
  \setromanfont[Numbers={OldStyle,Proportional},Ligatures={TeX, Common%, Historic, Contextual, Rare, Discretionary 
    }]{TeX Gyre Pagella}
     \setmathfont{Asana Math}
  \else %pdflatex
     \usepackage{ccfonts}
  \fi

    \message{PhDthesisTUB: Using  font D}
 \else
 \fi


  \ifCLASSINFOfontE
  \ifXeOrLua
  \setromanfont[Numbers={OldStyle,Proportional},Ligatures={TeX, Common%, Historic, Contextual, Rare, Discretionary 
    }]{TeX Gyre Pagella}
     \setmathfont{TeX Gyre Pagella Math}
    %\setmonofont[Scale=MatchLowercase]{Lucida Sans Typewriter}
  \else %pdflatex
     \usepackage[math]{iwona}
  \fi
    \message{PhDthesisTUB: Using font E}
 \else
 \fi

 \ifCLASSINFOfontF
  \ifXeOrLua
  \setromanfont[Numbers={OldStyle,Proportional},Ligatures={TeX, Common%, Historic, Contextual, Rare, Discretionary 
    }]{TeX Gyre Schola}
     \setmathfont{TeX Gyre Schola Math}
    %\setmonofont[Scale=MatchLowercase]{Lucida Sans Typewriter}
  \else %pdflatex
     \usepackage[math]{kurier}
  \fi
    \message{PhDthesisTUB: Using font F}
 \else
 \fi

  \ifCLASSINFOfontG
  \ifXeOrLua
  \setromanfont[Numbers={OldStyle,Proportional},Ligatures={TeX, Common%, Historic, Contextual, Rare, Discretionary 
    }]{TeX Gyre Termes}
     \setmathfont{TeX Gyre Termes Math}
    %\setmonofont[Scale=MatchLowercase]{Lucida Sans Typewriter}
  \else %pdflatex
     \usepackage[math]{anttor}
  \fi
    \message{PhDthesisTUB: Using font G}
 \else
 \fi

 \ifCLASSINFOfontH
  \ifXeOrLua
  \setromanfont[Numbers={OldStyle,Proportional},Ligatures={TeX, Common%, Historic, Contextual, Rare, Discretionary 
    }]{TeX Gyre Bonum}
     \setmathfont{TeX Gyre Bonum Math}
    %\setmonofont[Scale=MatchLowercase]{Lucida Sans Typewriter}
  \else %pdflatex
     \usepackage{kmath,kerkis}
  \fi
    \message{PhDthesisTUB: Using font H}
 \else
 \fi

  \ifCLASSINFOfontI
  \ifXeOrLua
  \setmainfont[Ligatures={TeX, Common%, Historic, Contextual, Rare, Discretionary 
    }]{DejaVu Sans}
  %  \setromanfont[Numbers={OldStyle,Proportional},Ligatures={TeX, Common%, Historic, Contextual, Rare, Discretionary 
  %  }]{TeX Gyre Pagella}
  \setmathfont{TeX Gyre DejaVu Math}

    %\setmonofont[Scale=MatchLowercase]{Lucida Sans Typewriter}
  \else %pdflatex
     \usepackage[utopia]{mathdesign}
  \fi
    \message{PhDthesisTUB: Using font I}
 \else
 \fi

  \ifCLASSINFOfontJ
  \ifXeOrLua

  \else %pdflatex
     \usepackage{fouriernc}
  \fi
    \message{PhDthesisTUB: Using font J}
 \else
 \fi

  \ifCLASSINFOfontK
  \ifXeOrLua

  \else %pdflatex
     \usepackage{pxfonts}
  \fi
    \message{PhDthesisTUB: Using font K}
 \else
 \fi

   \ifCLASSINFOfontL
  \ifXeOrLua

  \else %pdflatex
     \usepackage{mathpazo}
  \fi
    \message{PhDthesisTUB: Using font L}
 \else
 \fi

   \ifCLASSINFOfontM
  \ifXeOrLua

  \else %pdflatex
     \usepackage{mathpple}
  \fi
    \message{PhDthesisTUB: Using font M}
 \else
 \fi

   \ifCLASSINFOfontN
  \ifXeOrLua

  \else %pdflatex
     \usepackage[varg]{txfonts}
  \fi
    \message{PhDthesisTUB: Using font N}
 \else
 \fi

   \ifCLASSINFOfontO
  \ifXeOrLua

  \else %pdflatex
     \usepackage{mathtime}
  \fi
    \message{PhDthesisTUB: Using font O}
 \else
 \fi

    \ifCLASSINFOfontP
  \ifXeOrLua

  \else %pdflatex
     \usepackage{mathptmx}
  \fi
    \message{PhDthesisTUB: Using font P}
 \else
 \fi

    \ifCLASSINFOfontQ
  \ifXeOrLua

  \else %pdflatex
     \usepackage{mbtimes}
  \fi
    \message{PhDthesisTUB: Using font Q}
 \else
 \fi

    \ifCLASSINFOfontR
  \ifXeOrLua

  \else %pdflatex
     \usepackage{arev}
  \fi
    \message{PhDthesisTUB: Using font R}
 \else
 \fi

    \ifCLASSINFOfontS
  \ifXeOrLua

  \else %pdflatex
     \usepackage[charter]{mathdesign}
  \fi
    \message{PhDthesisTUB: Using font S}
 \else
 \fi

    \ifCLASSINFOfontT
  \ifXeOrLua

  \else %pdflatex
     \usepackage{comicsans}
  \fi
    \message{PhDthesisTUB: Using font T}
 \else
 \fi


    \ifCLASSINFOfontU
  \ifXeOrLua

  \else %pdflatex
     \usepackage[garamond]{mathdesign}
  \fi
    \message{PhDthesisTUB: Using font U}
 \else
 \fi


    \ifCLASSINFOfontV
  \ifXeOrLua

  \else %pdflatex
     \usepackage{fourier}
  \fi
    \message{PhDthesisTUB: Using font V}
 \else
 \fi

\ifCLASSINFOfontW
  \ifXeOrLua

  \else %pdflatex
         \usepackage{ccfonts,eulervm}
  \fi
    \message{PhDthesisTUB: Using font W}
 \else
 \fi

\ifCLASSINFOsetcustomfont
  \message{PhDthesisTUB: Using custom font}
\else
\fi % custom font

% If Font is not set throw a warning.
\ifCLASSINFOsetfont
\else
  \ClassWarning{PhDthesisTUB}{Using default font Latin Modern. If you
    would like to use other pre-defined fonts use `times' (The Cambridge 
    University PhD thesis guidelines recommend using Times font)  or `fourier'
    or load a custom font in the preamble.tex file by specifying `customfont' 
    in the class options}
  \RequirePackage{lmodern}

\fi


\ifxetex
  % XeLaTeX
   \usepackage{xltxtra}
  %\RequirePackage{fontspec}
  %\usepackage[no-math]{fontspec}

  %\DeclareSymbolFont{operators}{\encodingdefault}{\familydefault}{\mddefault}{n}
  %\DeclareMathAlphabet{\mathit}{\encodingdefault}{\familydefault}{\mddefault}{it}
  %\DeclareMathAlphabet{\mathbf}{\encodingdefault}{\familydefault}{\bfdefault}{n}
  
  %\usepackage[]{unicode-math}
  
  \RequirePackage[final]{microtype}

  
\else
  \ifluatex

  \RequirePackage{pdftexcmds}
  %\RequirePackage{fontspec}
   
  %\DeclareSymbolFont{operators}{\encodingdefault}{\familydefault}{\mddefault}{n}
%\DeclareMathAlphabet{\mathit}{\encodingdefault}{\familydefault}{\mddefault}{it}
%\DeclareMathAlphabet{\mathbf}{\encodingdefault}{\familydefault}{\bfdefault}{n}
 
  % If building with PDFLaTeX, use microtype spacing adjustments
  \RequirePackage[final]{microtype}

%\microtypesetup{
%  tracking   = smallcaps ,
%  protrusion = alltext ,
%  expansion  = basictext
%}
  \else
  % default: pdfLaTeX
  %:-------------------------- packages UTF8 -----------------------
  % If building with PDFLaTeX, use microtype spacing adjustments
  \RequirePackage[final]{microtype}
  
  \input{glyphtounicode}
  \pdfglyphtounicode{f_f}{FB00}
  \pdfglyphtounicode{f_i}{FB01}
  \pdfglyphtounicode{f_l}{FB02}
  \pdfglyphtounicode{f_f_i}{FB03}
  \pdfglyphtounicode{f_f_l}{FB04}
  \pdfgentounicode=1


   \fi
\fi




%:-------------------------- Glossary/Abbrev./Symbols -----------------------

\RequirePackage[toc,acronym,nomain,indexonlyfirst]{glossaries}
\glsdisablehyper
\newglossary[slg]{symbolslist}{syi}{syg}{Symbols}
\RequirePackage{longtable}

%:-------------------------- BibLatex ---------------------------
\RequirePackage{csquotes}
%:-------------------------- PDF/PS setup -----------------------
% png or pfg/pdf graphics?
%\RequirePackage{pgf}
\RequirePackage{import}
\RequirePackage{chapterfolder}


%******************************* Print / Online ********************************
% Defines a print / online version to define page-layout and hyperrefering

% Moved below other usepackage definitions to fix PDFLaTeX footnote warning
% Based on the suggestion by John Plaice

\ifsetDVI
  \special{papersize=\CLASSINFOpaperwidth,\CLASSINFOpaperheight}
  %\RequirePackage[unicode=true]{hyperref}  % extra option dvips
  %\setlength{\paperheight}{297mm}
  % \setlength{\paperwidth}{210mm}
       \RequirePackage[ bookmarksopen = false,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = red,
                 anchorcolor = green,
                 ]{hyperref}
\else
  %\RequirePackage[unicode=true]{hyperref}
  %\pdfpagewidth=\the\paperwidth
  %\pdfpageheight=\the\paperheight
  \pdfpageheight=\CLASSINFOpaperheight
   \pdfpagewidth=\CLASSINFOpaperwidth
\fi

\ifCLASSOPTIONprint
%\ifpdf
  % For Print version
  \hypersetup{
    final=true,
    plainpages=false,
    pdfstartview=FitV,
    pdftoolbar=true,
    pdfmenubar=true,
    bookmarksopen=false,
    bookmarksnumbered=true,
    breaklinks=true,
    linktocpage,
    colorlinks=true,
    linkcolor=black,
    urlcolor=black,
    citecolor=black,
    anchorcolor=black
  }
  \ifCLASSINFOcustommargin
  % Margin to be define in preamble using geometry package
  \else
    \ifsetDVI
      % Odd and Even side Margin for binding and set viewmode for PDF
      \RequirePackage[dvips,paper=\CLASSOPTIONpaper,hmarginratio=1:1,
        vmarginratio=1:1,scale=0.75,bindingoffset=5mm]{geometry}
    \else
      \RequirePackage[pdftex,paper=\CLASSOPTIONpaper,hmarginratio=1:1,
        vmarginratio=1:1,scale=0.75,bindingoffset=5mm]{geometry}
    \fi
  \fi

  \ifCLASSOPTIONtwoside
    \hypersetup{pdfpagelayout=TwoPageRight}
  \else
    \hypersetup{pdfpagelayout=OneColumn}
  \fi
%-->
\else
 % For PDF Online version
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
                 pdfdisplaydoctitle = false,
                 pdflang=Englisch,
                 pdfview = FitB,
                 %bookmarks=true,
                 %pdfpagelabels,
                 %pagebackref,
                 %hyperindex = true,
                 %hyperfigures,
                 %pdfpagelayout = SinglePage,
                 pdfpagelayout=OneColumn,
                 pdfpagemode = UseOutlines, 
                 pdfencoding=unicode
}
  \ifCLASSINFOcustommargin
    % Margin to be define in preamble using geometry package
    \else
      % No Margin staggering on Odd and Even side
      \ifsetDVI
        \RequirePackage[paper=\CLASSOPTIONpaper,hmarginratio=1:1,
          vmarginratio=1:1,scale=0.75]{geometry} % dvips
      \else
        \RequirePackage[pdftex,paper=\CLASSOPTIONpaper,hmarginratio=1:1,
          vmarginratio=1:1,scale=0.75]{geometry}
      \fi
    \fi
%                 ]{hyperref} 
  \ifCLASSOPTIONtwoside
    \hypersetup{pdfpagelayout=TwoPageRight}
  \else
    \hypersetup{pdfpagelayout=OneColumn}
  \fi
\fi

%\else



%\fi


%:-------------------------- page layout -----------------------



% *************************** Setting PDF Meta-Data ****************************
\ifpdf
% defined in thesis.xmpdata
\ifCLASSINFOpdfax
\else
\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author},
    pdfsubject={\@subject},
    pdfkeywords={\@keywords}
  }
}
\fi
\fi

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


% ***************************** Header Formatting ******************************
% Custom Header with Chapter Number, Page Number and Section Numbering

\RequirePackage{fancyhdr} % Define custom header

% Set Fancy Header Command is defined to Load FancyHdr after Geometry is defined
\ifCLASSOPTIONtwoside
\newcommand{\setFancyHdr}{
% ------------------------------
  \pagestyle{fancy}
  \renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. ##1 }}{}}
  \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
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
}
\setlength{\headheight}{25pt}
\else
\newcommand{\setFancyHdr}{
% ------------------------------
  \pagestyle{fancy}
  \renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. ##1 }}{}}
  \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
  \fancyhf{}
  \fancyhead[R]{\bfseries\rightmark}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0.5pt}
  \renewcommand{\footrulewidth}{0pt}
  \addtolength{\headheight}{0.5pt}
  \fancypagestyle{plain}{
    \fancyhead{}
    \renewcommand{\headrulewidth}{0pt}
  }
}
\setlength{\headheight}{14.5pt}
\fi


% If Margin has been set (default margin print/online version)
\ifCLASSINFOcustommargin
\makeatletter
\AtBeginDocument{
\@ifpackageloaded{geometry}{}{\ClassWarning{PhDthesisTUB}{%
  Custom margin is chosen, but geometry package is not loaded. Please load the
  `geometry' package in the preamble.}}
}
\makeatother
\else
\setFancyHdr % Apply fancy header settings otherwise apply it in preamble
\fi

% **************** Clear Header Style on the Last Empty Odd pages **************
\makeatletter
\renewcommand{\cleardoublepage}{\clearpage\ifCLASSOPTIONtwoside \ifodd\c@page\else%
  \hbox{}%
  \thispagestyle{empty}  % Empty header styles
  \newpage%
  \if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother
% \titleformat{\chapter}[display]
% {\bfseries\sffamily\Large}
% { %\Huge\textsc{\chaptertitlename}\sffamily
% \hfill\fontsize{80}{70}\selectfont\color{lightgray}\textbf{\thechapter}}
% {-2ex}
% {\filleft\fontsize{28}{49}\selectfont\scshape\baselineskip}
% [\vspace{-0ex}] 



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
\def\subtitle#1{\gdef\@subtitle{#1}}
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
\def\forthreviewer#1{\gdef\@forthreviewer{#1}}
\makeatother
% These macros define an environment for front matter that is always 
% single column even in a double-column document.
\makeatletter
\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}
\makeatother

% Set single column even under two column layout
\makeatletter
\newcommand{\setsinglecolumn}{
\if@twocolumn
   \onecolumn
\else
\fi
}
\makeatother

%define title page layout
\makeatletter
\renewcommand{\maketitle}{%
\computeTitlePageSpacing
\begin{singlespace}
\begin{alwayssingle}
\begin{center}

    \thispagestyle{empty}

{\usebox{\@PHDtitle}} % subtitle is defined
{\usebox{\@PHDsubtitle}} % subtitle is defined



\vspace{.15\titlepagespacing}
{\usebox{\@PHDauthor}}
\vspace*{0.5em}
\vspace{.2\titlepagespacing}
 {\usebox{\@PHDdegree}}
\vspace*{.2\titlepagespacing}
\vspace*{0.5em}
{\usebox{\@PHDcomitee}}
\vspace*{0.5em}
\vspace*{.3\titlepagespacing}
 {\usebox{\@PHDdate}} 
\end{center}
\end{alwayssingle}
\end{singlespace}
}

\makeatother

% page number for cover back side should have page number blanked


% ******************** To compute empty space in title page *******************
% Boxes below are used to space different contents on the title page
% Based on https://github.com/cambridge/thesis
\makeatletter

\newcommand{\computeTitlePageSpacing}{


% Title Box

\newsavebox{\@PHDtitle}
\begin{lrbox}{\@PHDtitle}
  \begin{minipage}[c]{0.98\textwidth}
  \vspace*{-10ex}
    \centering \Huge \singlespacing \bfseries{\@title}
    \\
  \end{minipage}
\end{lrbox}

\newsavebox{\@PHDsubtitle}
\begin{lrbox}{\@PHDsubtitle}
  \begin{minipage}[c]{0.98\textwidth}
    \centering \LARGE \singlespacing \bfseries{\@subtitle}
    \\
  \end{minipage}
\end{lrbox}

\newsavebox{\@PHDauthor}
\begin{lrbox}{\@PHDauthor}
\begin{minipage}[c]{\textwidth}
  {\Large \centering \singlespacing
      {{vorgelegt von} \par}
      {{\@olddegree} \par}
      {{\@author} \par}
      {geb. in {\@cityofbirth} \par}
  % {{\@cityofbirth} \par}    
  }
  \end{minipage}
\end{lrbox}

\newsavebox{\@PHDdegree}
\begin{lrbox}{\@PHDdegree}
\begin{minipage}[c]{\textwidth}
{\Large \centering \singlespacing
  \vspace*{1ex}
    {{\@collegeordept} \par}
    {{\@university} \par}
    {{zur Erlangung des akademischen Grades} \par}
    \vspace*{1ex}
    {{\@degreefull} \par}
  
    { {\@degree} \par}
  \vspace*{1ex}
{{genehmigte Dissertation} \par}
}
  \end{minipage}
\end{lrbox}

\newsavebox{\@PHDcomitee}
\begin{lrbox}{\@PHDcomitee}
\begin{minipage}[c]{\textwidth}
 {\Large \singlespacing
  {{Promotionsausschuss:} \par}
  {{Vorsitzender: {\@comiteehead}} \par}
  {{Gutachter: {\@firstreviewer}} \par}
  {{Gutachterin: {\@secondreviewer}} \par}
  {{Gutachter: {\@thirdreviewer}} \par}
  %{{Gutachter: {\@forthreviewer}} \par}
  \vspace*{1ex}
  {\@degreedate}
}%end large
  \end{minipage}
\end{lrbox}

\newsavebox{\@PHDdate}
\begin{lrbox}{\@PHDdate}
\begin{minipage}[c]{\textwidth}
    {\Large 
       \begin{center}
    {{{\@degreeplaceyear}}}
    \end{center}
    }
  \end{minipage}
\end{lrbox}


%  Now to compute the free vertical space
\newlength{\titlepagespacing}
\setlength{\titlepagespacing}{ \textheight %
                                           - \totalheightof{\usebox{\@PHDtitle}}
                                           - \totalheightof{\usebox{\@PHDsubtitle}}
                                           - \totalheightof{\usebox{\@PHDauthor}}
                                           - \totalheightof{\usebox{\@PHDdegree}}
                                           - \totalheightof{\usebox{\@PHDcomitee}}
                                           - \totalheightof{\usebox{\@PHDdate}}
}
}
\makeatother
%:-------------------------- front matter layout -----------------------




%define title page layout
\makeatletter
\newcommand{\makepretitle}{%
\computePreTitlePageSpacing
\begin{singlespace}
\begin{alwayssingle}
\begin{center}

    \thispagestyle{empty}

{\usebox{\@PHDtitle}} % subtitle is defined
{\usebox{\@PHDsubtitle}} % subtitle is defined
\vspace{.15\titlepagespacing}

{\usebox{\@PHDauthor}}
\vspace*{0.5em}
\vspace{.2\titlepagespacing}
 {\usebox{\@PHDdegree}}
\vspace*{.2\titlepagespacing}
\vspace*{1.5em}
\vspace*{.3\titlepagespacing}
 {\usebox{\@PHDdate}} 
\end{center}
\end{alwayssingle}
\end{singlespace}
}

\makeatother

% page number for cover back side should have page number blanked


% ******************** To compute empty space in title page *******************
% Boxes below are used to space different contents on the title page
% Based on https://github.com/cambridge/thesis
\makeatletter

\newcommand{\computePreTitlePageSpacing}{


% Title Box
\newsavebox{\@PHDtitle}
\begin{lrbox}{\@PHDtitle}
  \begin{minipage}[c]{0.98\textwidth}
    \centering \Huge  \singlespacing  \bfseries{\@title}
    \\
  \end{minipage}
\end{lrbox}

\newsavebox{\@PHDsubtitle}
\begin{lrbox}{\@PHDsubtitle}
  \begin{minipage}[c]{0.98\textwidth}
    \centering \LARGE \singlespacing \bfseries{\@subtitle}
    \\
  \end{minipage}
\end{lrbox}

\newsavebox{\@PHDauthor}
\begin{lrbox}{\@PHDauthor}
\begin{minipage}[c]{\textwidth}
  {\Large \centering \singlespacing
      {{vorgelegt von} \par}
      {{\@olddegree} \par}
      {{\@author} \par}
      {aus {\@cityofbirth} \par}
  % {{\@cityofbirth} \par}    
  }
  \end{minipage}
\end{lrbox}

\newsavebox{\@PHDdegree}
\begin{lrbox}{\@PHDdegree}
\begin{minipage}[c]{\textwidth}
{\Large \centering \singlespacing
    {{\@collegeordept} \par}
    {{\@university} \par}
    {{zur Erlangung des Akademischen Grades} \par}
    \vspace*{1ex}
    {{\@degreefull} \par}
    { {\@degree} \par}
  \vspace*{1ex}
}
  \end{minipage}
\end{lrbox}


\newsavebox{\@PHDdate}
\begin{lrbox}{\@PHDdate}
\begin{minipage}[c]{\textwidth}
    {\Large  \singlespacing
       \begin{center}
    {{\@degreedate}}
    \end{center}
    }
  \end{minipage}
\end{lrbox}

%  Now to compute the free vertical space
\newlength{\titlepagespacing}
\setlength{\titlepagespacing}{ \textheight %
                                           - \totalheightof{\usebox{\@PHDtitle}}
                                           - \totalheightof{\usebox{\@PHDsubtitle}}
                                           - \totalheightof{\usebox{\@PHDauthor}}
                                           - \totalheightof{\usebox{\@PHDdegree}}
                                            - \totalheightof{\usebox{\@PHDdate}}
}
}
\makeatother





% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{
  
\cleardoublepage
\setsinglecolumn
  \vspace*{0.2\textheight}
  \thispagestyle{empty}
  \centering
}

% ********************************* Dedication *********************************
% The dedication environment makes sure the dedication gets its
% own page, centered



% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgementsOld}
{\thispagestyle{empty}

\begin{center}
\cleardoublepage
\setsinglecolumn
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}}

\newenvironment{acknowledgements}
{  
  \cleardoublepage
  \setsinglecolumn
  %\vspace*{1.5cm}
  \chapter*{\centering \Large Acknowledgements}
  %\chapter*{\makebox[1.0\linewidth]{\Large  Acknowledgements}}
  \thispagestyle{empty}
}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\thispagestyle{empty}
\begin{center}
\cleardoublepage
\setsinglecolumn
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}\begin{quote}}
{\end{quote}}

% ******************************** Abstract ************************************
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

% To include only the Title and the abstract pages for submission to BoGS
\ifCLASSINFOabstract
    \defineAbstracttrue
    % Disable the table of contents, figures, tables, index and nomenclature
    \renewcommand{\tableofcontents}{}
    \renewcommand{\listoffigures}{}
    \renewcommand{\listoftables}{}
    \renewcommand{\bibname}{}
    \renewcommand{\bibliography}[1]{\thispagestyle{empty}}
    \renewcommand{\cfchapter}[3]{}
    \renewcommand{\printglossary}[2][YYY]{}
    \renewcommand{\label}[1]{}
    \renewcomman{\makeglossaries}{}
\else
    \defineAbstractfalse
\fi


\newenvironment{abstractsOld} {\pagestyle{empty}
  \begin{center}\begin{alwayssingle}
  \cleardoublepage
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

\makeatletter
\newenvironment{abstracts} {
\ifCLASSINFOabstract
% Separate abstract as per Student Registry guidelines
  \thispagestyle{empty}
  \setsinglecolumn
  \begin{center}
    { \Large {\bfseries {\@title}} \par}
    { \large {\bfseries {\@subtitle}} \par}
    {{\large \vspace*{1em} \@author} \par}
  \end{center}
\else
  \cleardoublepage
  \setsinglecolumn
  %\chapter*{\centering \Large Abstract}
  \chapter*{\makebox[1.0\linewidth]{\Large  Abstract}}
  \thispagestyle{empty}
  \fi
  }
\makeatother

\newenvironment{zusammenfassungOld} {\pagestyle{empty}
  \begin{center}\begin{alwayssingle}
  \cleardoublepage
  \vspace*{1.5cm}
  {\Large \bfseries  Zusammenfassung}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}
\makeatletter
\newenvironment{zusammenfassung} {
\ifCLASSINFOabstract
% Separate abstract as per Student Registry guidelines
  \thispagestyle{empty}
  \setsinglecolumn
  \begin{center}
    { \Large {\bfseries {\@title}} \par}
    { \large {\bfseries {\@subtitle}} \par}
    {{\large \vspace*{1em} \@author} \par}
  \end{center}
\else
  \cleardoublepage
  \setsinglecolumn
  %\chapter*{\centering \Large Zusammenfassung}
  \chapter*{\makebox[1.0\linewidth]{\Large  Zusammenfassung}}
  \thispagestyle{empty}
  \fi
  }
\makeatother
%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractslong} {
  \begin{center}
  \cleardoublepage
  \setsinglecolumn
  \thispagestyle{empty}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm} \begin{quote}}
{\end{quote}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately
\makeatletter
\newenvironment{abstractseparate} {\begin{alwayssingle} \pagestyle{empty}
\cleardoublepage
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

\newenvironment{declaration} {
  \begin{center}
  \cleardoublepage
  \setsinglecolumn
  \thispagestyle{empty}
  \vspace*{1.5cm}
  {\Large \bfseries  Declaration}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}}
%Deutsche Zusammenfassung



%:-------------------------- page numbers: roman+arabic -----------------------

% ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

%\newenvironment{romanpages}
%{
% \setcounter{page}{1}
% \renewcommand{\thepage}{\roman{page}}
%} % close romanpage env't
 
{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

%\DeclareMathVersion{mathchartertext}
%\SetSymbolFont{letters}{mathchartertext}{OML}{mdbch}{m}{n}
%\newcommand{\gchar}[1]{\mathversion{mathchartertext}$#1$\mathversion{normal}}
\newcommand{\gchar}[1]{$#1$}

