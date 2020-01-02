\LoadClass[letterpaper]{article}
\ProvidesClass{coursework}[2020/01/01 v1]

\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}
\RequirePackage{hyperref}
\RequirePackage[american]{babel}
\RequirePackage[raise]{datetime}
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{csquotes}
\RequirePackage{xstring}
\RequirePackage[letterpaper, margin=1in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{lscape}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{tabu}
\RequirePackage{multirow}
\RequirePackage[
    style=apa,
    backend=biber,
    sortcites=true,
    sorting=nyt,
%    isbn=false,
%    url=false,
%    doi=false,
%    eprint=false,
    hyperref=true,
    backref=true,
%    firstinits=false,
    bibencoding=utf8
]{biblatex}

\let\@subtitle\@empty
\let\@baseurl\@empty
\let\@keywords\@empty
\let\@courseDept\@empty
\let\@courseNum\@empty
\let\@courseName\@empty
\let\@courseInst\@empty
\let\@instructorTitle\@empty
\let\@instructorFirst\@empty
\let\@instructorMiddle\@empty
\let\@instructorMiddleSecond\@empty
\let\@instructorLast\@empty

\pagestyle{fancy}
\fancyhf{}
\lhead{\textsc{\@docTitle}}
\rhead{
    \@authorLast
    \ifdefempty{\@authorFirst}{}{, \StrLeft{\@authorFirst}{1}.}
    \ifdefempty{\@authorMiddle}{}{\StrLeft{\@authorMiddle}{1}.}
}
\lfoot{\scriptsize Retrieved from\\ \href{\@baseurl}{\@baseurl}}
\rfoot{Page \thepage}

\renewcommand{\title}[1]{\gdef\@docTitle{#1} \gdef\@title{#1}}
\renewcommand{\author}[3]{
    \gdef\@authorFirst{#1}
    \gdef\@authorMiddle{#2}
    \gdef\@authorLast{#3}
    \gdef\@author{#1\ #2\ #3}
}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
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
\newcommand\instructorList{}
\newcommand{\instructor}[5]
    {
        \gdef\@instructorTitle{#1}
        \gdef\@instructorFirst{#2}
        \gdef\@instructorMiddle{#3}
        \gdef\@instructorMiddleSecond{#4}
        \gdef\@instructorLast{#5}
    }

\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
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
        \@instructorTitle.
        \@instructorFirst
        \ifdefempty{\@instructorMiddle}{}{\ \StrLeft{\@instructorMiddle}{1}.}%
        \ifdefempty{\@instructorMiddleSecond}{}{\ \StrLeft{\@instructorMiddleSecond}{1}.}
        \@instructorLast
      \end{tabular}\par}%
    \vskip 1em%
    %{\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}

\newenvironment{smartabs}
    {\begin{abstract}}
    {\end{abstract} \printkeywords}

\hypersetup{
	pdflang={en-US},
	pdfdisplaydoctitle=true,
	unicode=true,
	baseurl=\@baseurl
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