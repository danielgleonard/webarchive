\LoadClass[letterpaper]{article}
\ProvidesClass{coursework}[2020/08/28 v2]

\usepackage{iftex}

\ifXeTeX
	\RequirePackage{fontspec}
	\RequirePackage{polyglossia}
	\setdefaultlanguage[variant=american]{english}
	\usepackage{unicode-math}
	\setmainfont{CMU Serif}
	\setsansfont{CMU Sans Serif}
	\setmonofont{CMU Typewriter Text}
	\setmathfont{Latin Modern Math}
\else
	\RequirePackage{lmodern}
	\RequirePackage[T1]{fontenc}
	\RequirePackage{textcomp}
	\RequirePackage[utf8]{inputenc}
	\RequirePackage{microtype}
	\RequirePackage{babel}
\fi

\RequirePackage{hyperref}
\RequirePackage[showdow,useregional]{datetime2}
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{csquotes}
\RequirePackage{epigraph}
\RequirePackage{xstring}
\RequirePackage[letterpaper, margin=1in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[inline]{enumitem}
\RequirePackage{lscape}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{tabu}
\RequirePackage{multirow}
\RequirePackage{siunitx}
% \RequirePackage{xurl}
% \RequirePackage{doi}
\RequirePackage[
%	authordate,
	style=apa,
	backend=biber,
	sortcites=true,
	sorting=nyt,
%	isbn=false,
%	url=false,
%	doi=true,
%	eprint=false,
	hyperref=true,
	backref=false,
%	firstinits=false,
	bibencoding=utf8
]{biblatex}
\DeclareFieldFormat{doi}{%
  \mkbibacro{DOI}\addcolon\space
  \ifhyperref
    {\href{https://doi.org/#1}{\nolinkurl{#1}}}
    {\nolinkurl{#1}}}
% \urlstyle{tt}

\let\@titlepunct\@empty
\let\@subtitle\@empty
\let\@shorttitle\@empty
\let\@baseurl\@empty
\let\@keywords\@empty
\let\@courseDept\@empty
\let\@courseNum\@empty
\let\@courseName\@empty
\let\@courseInst\@empty

\pagestyle{fancy}
\fancyhf{}
\lhead{\textsc{\ifdefempty{\@shorttitle}{\@docTitle}{\@shorttitle}}}
\rhead{
	\@authorLast
	\ifdefempty{\@authorFirst}{}{, \StrLeft{\@authorFirst}{1}.}
	\ifdefempty{\@authorMiddle}{}{\StrLeft{\@authorMiddle}{1}.}
}
% \lfoot{\scriptsize Retrieved from\\ \href{\@baseurl}{\@baseurl}}
\cfoot{Page \thepage\ of \pageref{LastPage}}

\renewcommand{\title}[1]{\gdef\@docTitle{#1} \gdef\@title{#1}}
\renewcommand{\author}[3]{
	\gdef\@authorFirst{#1}
	\gdef\@authorMiddle{#2}
	\gdef\@authorLast{#3}
	\gdef\@author{#1\ #2\ #3}
}
\newcommand{\titlepunct}[1]{\gdef\@titlepunct{#1}}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\shorttitle}[1]{\gdef\@shorttitle{#1}}
\newcommand{\baseurl}[1]{\gdef\@baseurl{#1}}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
\newcommand{\printkeywords}[0]{\textbf{Keywords:} \textit{\@keywords}}
\newcommand{\course}[4]
	{
		\gdef\@courseDept{#1}
		\gdef\@courseNum{#2}
		\gdef\@courseName{#3}
		\gdef\@courseInst{#4}
	}
\newcommand{\instructorList}{}
\makeatletter
\newcommand{\instructor}[5]
	{
		\g@addto@macro\instructorList
			{%
				\item%
				\def\@instTitle{#1}%
				\def\@instFirst{#2}%
				\def\@instSec{#3}%
				\def\@instThird{#4}%
				\def\@instLast{#5}%
				%
				\ifdefempty{\@instTitle}{}{\@instTitle.\ }%
				\@instFirst%
				\ifdefempty{\@instSec}{}{\ \StrLeft{\@instSec}{1}.}%
				\ifdefempty{\@instThird}{}{\ \StrLeft{\@instThird}{1}.}
				\@instLast%
			}
	}

\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \setlength{\parindent}{0em}
  \let \footnote \thanks
	{\LARGE \@title \ifdefempty{\@subtitle}{}{\\\Large\@subtitle} \par}%
	\vskip 1.5em%
	{\large
	  \lineskip .5em%
	  \begin{tabular}[t]{c}%
		{\small Turned in on} \\
		\@date \\
		{\small by} \\
		\@authorFirst\ 
		\ifdefempty{\@authorMiddle}{}{\StrLeft{\@authorMiddle}{1}.}
		\@authorLast \\
		{\small for the class} \\
		\@courseDept\ \@courseNum\ \@courseName \\
		{\small at} \\
		\@courseInst \\
		{\small taught by} \\
		\begin{itemize*}[label={}, itemjoin={,}, itemjoin*={\ {\small and}}]
			\instructorList
		\end{itemize*}
	  \end{tabular}\par}%
	\vskip 1em%
	%{\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}

\hypersetup{
	pdflang={en-US},
	pdfdisplaydoctitle=true,
	unicode=true,
	% baseurl=\@baseurl
}

\AtBeginDocument{
	% Add hyperref info that depends on author input
	\hypersetup
		{
			pdftitle=\@docTitle\ \@subtitle,
			pdfauthor=\@authorFirst\ \@authorMiddle\ \@authorLast,
			pdfkeywords=\@keywords
		}
	
}

\makeatother