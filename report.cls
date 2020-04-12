%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{report}[2020/03/06 v1.0.0 Presentation Report Class]
\NeedsTeXFormat{LaTeX2e}

%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry)
%-------------------------------------------------------------------------------

% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to put a background to the document
\RequirePackage[pages=some]{background}
\RequirePackage{graphicx}
\RequirePackage{blindtext}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome}
\RequirePackage[default,opentype]{sourcesanspro}
% Needed to put boxes
\RequirePackage[skins]{tcolorbox}
% Needed to set section font
\RequirePackage{sectsty}
% Needed to define colors
\RequirePackage{xcolor}
% Needed to customize ToC
\RequirePackage{tocloft}
\RequirePackage{calc}
% Needed to write text at specific location
\RequirePackage[absolute,quiet,overlay]{textpos}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}

%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir

%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=2.0cm, top=4.5cm, right=2.0cm, bottom=3.0cm, footskip=1.0cm}

%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
% Project colors
\definecolor{orangecrab}{HTML}{E55934}
\definecolor{bluewave}{HTML}{3F72AC}
\definecolor{clearocean}{HTML}{1B97D1}
\definecolor{darkora}{HTML}{282830}

\sectionfont{\color{orangecrab}}
\subsectionfont{\color{bluewave}}

%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Set the FontAwesome font to be up-to-date
\newfontfamily\FontAwesome[Path=\@fontdir]{FontAwesome}

% Set font for header (default is Roboto)
\newfontfamily\robotofont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\robotofontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

%-------------------------------------------------------------------------------
%                Commands for organization information
%-------------------------------------------------------------------------------

% Define background images
% Usage: \firstpage{<path-to-image>}
% Usage: \background{<path-to-image>}
\newcommand*{\firstpage}[1]{\def\@firstpage{#1}}
\newcommand*{\background}[1]{\def\@background{#1}}
\newcommand*{\logo}[1]{\def\@logo{#1}}
\newcommand*{\lheader}[1]{\def\@lheader{#1}}
\newcommand*{\rheader}[1]{\def\@rheader{#1}}

\let\@team\@empty
\let\@university\@empty
\let\@homepage\@empty
\let\@email\@empty
\let\@github\@empty
\let\@gitlab\@empty

% Define project's basic properties
% Usage: \team{<team name>}
% Usage: \university{<university name>}
\newcommand*{\team}[1]{\def\@team{#1}}
\newcommand*{\university}[1]{\def\@university{#1}}

% Defines project's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines project's email (optional)
% Usage: \email{<email address>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines project's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines project's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

%\newenvironment{boxed}[1]{
%  \begin{center}
%    #1
%	\makebox[\textwidth]{\includegraphics[width=0.9\linewidth,height=0.9\textheight]{box.png}}
%  \end{center}
%}

\newtcolorbox{boxed}[2][]{
  before    = \begin{center},
  enhanced,
  center title,
  hbox,
  toprule   = 10pt,
  titlerule = 10pt,
  boxrule   = 3pt,
  outer arc = 0pt,
  arc       = 0pt,
  colframe  = darkora,
  colback   = white,
  coltitle  = white,
  title     = {\MakeUppercase{#2}},
  fonttitle = \bfseries\fontsize{20}{20}\selectfont,
  after     = \end{center},
  #1
}

\newtcolorbox{boxedfull}[2][]{
  before    = \begin{center},
  enhanced,
  center title,
  hbox,
  toprule   = 10pt,
  titlerule = 10pt,
  boxrule   = 3pt,
  outer arc = 0pt,
  arc       = 0pt,
  colframe  = darkora,
  colback   = white,
  coltitle  = white,
  title     = {\MakeUppercase{#2}},
  fonttitle = \bfseries\fontsize{20}{20}\selectfont,
  after     = \end{center},
  boxsep	= 0pt,
  left		= 0pt,
  right		= 0pt,
  top		= 0pt,
  bottom	= 0pt
  #1
}

% -------------------------------------------------------------------------

\AddEverypageHook{
  \ifnum\value{page}=1\relax
    \backgroundsetup{
      scale=1,
      angle=0,
      opacity=1.0,
      contents={
        \includegraphics[width=\paperwidth,height=\paperheight]{\@firstpage}
	 }
    }
  \else
    \backgroundsetup{
      scale=1,
      angle=0,
      opacity=1.0,
      contents={
        \includegraphics[width=\paperwidth,height=\paperheight]{\@background}
	 }
    }
	\TPoptions{absolute=true,showboxes=false}
    \begin{center}
      \begin{textblock*}{9cm}(0cm,1.0cm)
        {\color{white}\fontsize{18}{22}\selectfont\MakeUppercase\@lheader}
      \end{textblock*}
	 \begin{textblock*}{9cm}(11.5cm,1.0cm)
        {\color{white}\fontsize{18}{22}\selectfont\MakeUppercase\@rheader}
      \end{textblock*}
    \end{center}
  \fi
  \BgMaterial
}

\renewcommand\maketitle{
  \begin{center}
    \includegraphics[scale=0.08]{\@logo}
  \end{center}
  \begin{center}
    {\Huge\color{white}\bfseries\@title\par}
	\vspace*{2ex}
	{\ifx\@team\@empty\else\Large\color{white}\bfseries\@team\par\fi}
	\vspace*{2ex}
    {\ifx\@university\@empty\else\large\color{white}\@university\par\fi}
	\vspace*{2ex}
	{\ifx\@homepage\@empty\else\large\color{white}\FontAwesome\href{\@homepage}{}\fi}
	{\ifx\@github\@empty\else\large\color{white}\FontAwesome\href{\@github}{}\fi}
	{\ifx\@gitlab\@empty\else\large\color{white}\FontAwesome\href{\@gitlab}{}\fi}	
	{\ifx\@email\@empty\else\large\color{white}\FontAwesome\href{\@email}{}\fi}
    \par
	\vspace*{8ex}
	{\color{white}\@author\par}
  \end{center}
  \TPoptions{absolute=true,showboxes=false}
  \begin{center}
    \begin{textblock*}{10cm}(5.5cm,20.1cm)
      {\color{white}\bfseries\fontsize{20}{25}\selectfont Réalisé le \@date}
    \end{textblock*}
  \end{center}
}

\let\stdl@section\l@section
\renewcommand*{\l@section}[2]{%
  \stdl@section{\textcolor{orangecrab}{#1}}{\textcolor{orangecrab}{#2}}}
\let\stdl@subsection\l@subsection
\renewcommand*{\l@subsection}[2]{%
  \stdl@subsection{\bfseries\textcolor{bluewave}{#1}}{\textcolor{bluewave}{#2}}}
