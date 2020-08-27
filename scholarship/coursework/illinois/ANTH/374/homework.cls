\LoadClass[letterpaper]{article}
\ProvidesClass{homework}

\RequirePackage{ifluatex}
\ifluatex
    \RequirePackage{fontspec}
    \RequirePackage{unicode-math}
    \RequirePackage{polyglossia}
\else
    \RequirePackage{babel}
    \RequirePackage[T2A,T1]{fontenc}
    \RequirePackage{textcomp}
    \RequirePackage[utf8]{inputenc}
    \RequirePackage{amsfonts}
\fi

\RequirePackage{amsmath}
\RequirePackage{lmodern}
\RequirePackage{microtype}
\RequirePackage{hyperref}
\RequirePackage[raise]{datetime}
\RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage[chicago]{ellipsis}
\RequirePackage{csquotes}
\RequirePackage{epigraph}
\RequirePackage{xstring}
\RequirePackage[letterpaper, margin=1in]{geometry}
\RequirePackage{setspace}
\doublespacing
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[inline]{enumitem}
\RequirePackage{lscape}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{tabu}
\RequirePackage{multirow}
\RequirePackage{siunitx}
\RequirePackage[
    authordate,
    backend=biber,
%    isbn=false,
%    url=false,
%    doi=false,
%    eprint=false,
    hyperref=true,
    backref=true,
%    firstinits=false,
    bibencoding=utf8
]{biblatex-chicago}

\let\@titlesep\@empty
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
    \@authorLast%
    \ifdefempty{\@authorFirst}{}{,\ \StrLeft{\@authorFirst}{1}.}%
    \ifdefempty{\@authorMiddle}{}{\ \StrLeft{\@authorMiddle}{1}.}%
}
\lfoot{}
\cfoot{Page \thepage\ of \pageref{LastPage}}
\rfoot{}

\renewcommand{\title}[1]{\gdef\@docTitle{#1} \gdef\@title{#1}}
\renewcommand{\author}[3]{
    \gdef\@authorFirst{#1}
    \gdef\@authorMiddle{#2}
    \gdef\@authorLast{#3}
    \gdef\@author{#1\ #2\ #3}
}
\newcommand{\titlesep}[1]{\gdef\@titlesep{#1}}\titlesep{:}
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
  \newpage\noindent%
  \let \footnote \thanks%
        \@authorFirst\ 
        \ifdefempty{\@authorMiddle}{}{\StrLeft{\@authorMiddle}{1}.\ }%
        \@authorLast \\
        {\scshape due}\ \@date \\
        \begin{itemize*}[label={}, itemjoin={,}, itemjoin*={\ {\small and}}]
            \instructorList
        \end{itemize*}\\
        \@courseDept\ \@courseNum\ \@courseName%
  \begin{center}%
    {\large \@title \ifdefempty{\@subtitle}{}{\@titlesep\ \large\@subtitle}}%
    %{\large \@date}%
  \end{center}%
  }

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
    		pdftitle=\@docTitle\@titlesep\ \@subtitle,
    		pdfauthor=\@authorFirst\ \@authorMiddle\ \@authorLast,
    		pdfkeywords=\@keywords
    	}
	
}

\makeatother