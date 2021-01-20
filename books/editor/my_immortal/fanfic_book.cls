% !TeX root = ./my_immortal.tex

\LoadClass[10pt,draft,titlepage]{myoctavo}
% \LoadClass[10pt]{book}
% \LoadClass[letterpaper,twoside]{scrbook}
\ProvidesClass{fanfic_book}[2020/09/13 v1]
% \linespread{1.15}

\makeatletter

\usepackage{iftex}
\RequireXeTeX

\ifXeTeX
	\RequirePackage{fontspec}
	\RequirePackage{polyglossia}
	\setdefaultlanguage[variant=american]{english}
	\usepackage{unicode-math}
	% \setmainfont{CMU Serif}
	% \RequirePackage{garamondlibre}
	\RequirePackage{CormorantGaramond}
	% \setmainfont[Numbers=OldStyle]{Adobe Garamond}
	% \RequirePackage[proportional,defaultfeatures={Variant=05}]{libertine}
	\setsansfont{CMU Sans Serif}
	\setmonofont{CMU Typewriter Text}
	\setmonofont{Courier New}
	\setmathfont{Latin Modern Math}

	\newfontfamily\MCRfont{My Chemical Romance}
\else
	\RequirePackage{lmodern}
	\RequirePackage[T1]{fontenc}
	\RequirePackage{textcomp}
	\RequirePackage[utf8]{inputenc}
	\RequirePackage{babel}
\fi

\RequirePackage{microtype}
\PassOptionsToPackage{hyphens}{url}
\RequirePackage{hyperref}
\def\UrlBreaks{\do\/\do-}
\RequirePackage[en-US,showdow]{datetime2}
\DTMlangsetup[en-US]{ord=raise}
\renewcommand*{\DTMenglishampmfmt}[1]{~\textsc{#1}}
\RequirePackage{graphicx}
% \RequirePackage{newclude}
\RequirePackage{wrapfig}
\RequirePackage{csquotes}
\RequirePackage{fmtcount}
\RequirePackage{epigraph}
\RequirePackage{xstring}
\RequirePackage{ifdraft}
\RequirePackage{xifthen}
% \RequirePackage[
	% top=0.5in,
	% bottom=0.75in,
	% headheight=13pt, % as per the warning by fancyhdr
	% includehead,includefoot,
	% heightrounded, % to avoid spurious underfull messages
% ]{geometry}
\RequirePackage{setspace}\singlespacing
\RequirePackage{textcase}
\newcommand\textlcsc[1]{\textsc{\MakeTextLowercase{#1}}}
\RequirePackage{lipsum}
\RequirePackage{titlesec}
\RequirePackage[titles]{tocloft}
\RequirePackage{titletoc}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[inline]{enumitem}
\RequirePackage{lscape}
\RequirePackage{booktabs}
\RequirePackage{marginnote}
% \RequirePackage{parskip}
\RequirePackage{longtable}
\RequirePackage{tabu}
\RequirePackage{multirow}
\RequirePackage{etoolbox}
\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}
\RequirePackage{scrextend}
\RequirePackage{siunitx}
% \RequirePackage{glossaries}
\RequirePackage[
	% authordate,
	backend=biber,
	hyperref=true,
	backref=true,
	bibencoding=utf8
]{biblatex-chicago}
\DeclareFieldFormat{doi}{%
  \mkbibacro{DOI}\addcolon\space
  \ifhyperref
    {\href{https://doi.org/#1}{\nolinkurl{#1}}}
    {\nolinkurl{#1}}}
\urlstyle{tt}

\let\@titlepunct\@empty
\let\@subtitle\@empty
\let\@shorttitle\@empty
\let\@baseurl\@empty
\let\@keywords\@empty
\let\@courseDept\@empty
\let\@courseNum\@empty
\let\@courseName\@empty
\let\@courseInst\@empty

\if@titlepage
    \renewcommand\maketitle{\pagenumbering{gobble}\phantom{}\cleardoublepage\begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
    \let\footnote\thanks
%    \end{macrocode}
%    The title itself is centered vertically, with a little offset brought by
%    a |\vskip|.
%    \begin{macrocode}
    \null\vfil
    \vspace{-1.5in}
%    \end{macrocode}
%    Now we can set the title, using the |\LARGE| fount, followed by a little
%    bit of vertical space, and then the authors, set in |\large| fount. To
%    ensure everything lines up nicely in a single column, we resort to the
%    tabular environment. A little vertical space is then followed by the date.
%    \begin{macrocode}
	\begin{center}%
		\vskip 3cm
        {\Large
        \lineskip .75em%
        \begin{tabular}[t]{c}%
            \@author
		\end{tabular}\par}%
		\vskip 2cm
        {\Huge \MCRfont \@title \par}%
        % \vskip 3em%
		\vskip 4cm%
		{\textlcsc{With a new introduction by}\par}%
		\vskip .5em%
        {\scshape \@editor \par}%
    \end{center}\par
%    \end{macrocode}
%    Calling |\@thanks| prints the information to go into the footnote, and
%    completes the printing on the page.
%    \begin{macrocode}
    \@thanks
    \vfil\null
    \end{titlepage}%
%    \end{macrocode}
%    Having finished the printing of the title page, we now clean up.
%    \begin{macrocode}
    \setcounter{footnote}{0}%
    \let\thanks\relax
    \let\maketitle\relax
    \gdef\@thanks{}
    % \gdef\@author{}
    \gdef\@title{}}
\fi

% \pagestyle{fancy}
% \fancyhf{}
% \fancyhead[CE]{\textsc{\ifdefempty{\@shorttitle}{\@docTitle}{\@shorttitle}}}
% % \fancyhead[CO]{}
% \fancyhead[LE,RO]{\thepage}

\renewcommand{\title}[1]{\gdef\@docTitle{#1} \gdef\@title{#1}}
\newcommand{\editor}[3]{
	\gdef\@editorFirst{#1}
	\gdef\@editorMiddle{#2}
	\gdef\@editorLast{#3}
	\gdef\@editor{\@editorFirst\ \ifdefempty{\@editorMiddle}{}{\StrLeft{\@editorMiddle}{1}.\ }\@editorLast}
}
\newcommand{\titlepunct}[1]{\gdef\@titlepunct{#1}}
% \newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\shorttitle}[1]{\gdef\@shorttitle{#1}}
\newcommand{\baseurl}[1]{\gdef\@baseurl{#1}}

\usepackage{suffix}

\newcommand\chapterauthor[1]{\authortoc{#1}\printchapterauthor{#1}}
\WithSuffix\newcommand\chapterauthor*[1]{\printchapterauthor{#1}}

\newcommand{\printchapterauthor}[1]{%
  {\parindent0pt\vspace{-3em}%
  \scshape#1%
  \par\nobreak\vspace*{1.5\baselineskip \@minus 2\p@}}
  \@afterheading%
}
\newcommand{\authortoc}[1]{%
  \addtocontents{toc}{\vskip-10pt}%
  \addtocontents{toc}{%
    \protect\contentsline{chapter}%
    {\mdseries\scshape\protect\footnotesize#1}{}{}}
  \addtocontents{toc}{\vskip5pt}%
}

\newlength{\interwordspace}
\settowidth{\interwordspace}{\ }
\titleformat{\section}%[display]
	{\large\centering}	% format
    {\thesection}		% label
    {\interwordspace}				% sep
	{}					% before
% \titlespacing*{\section}
%     {0em}
%     {-0.5\baselineskip \@minus -2\p@}
%     {0.75\baselineskip \@minus 2\p@}

\titlecontents			% Modify TOC
	{chapter}			% section level
	[0em]				% left
	{\vspace{10pt}}		% above-code
	{}					% numbered-entry-format
	{}					% numberless-entry-format
	{\hfill\contentspage}					% filler-page-format
%	[]					% below-code
%\dottedcontents			% Modify TOC
%	{section}			% section level
%	[0em]				% left
%	{}					% above-code
%	{6em}					% label width
%	{6em}					% leader width
\addtolength{\cftsecnumwidth}{26pt}
\renewcommand\@dotsep{2}
\renewcommand{\cftdotsep}{2}

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
			pdfauthor=\@author,
			pdfkeywords=\@keywords
		}
	
}

\renewcommand{\dotfill}{\marginpar{\texttt{\textbackslash dotfill}} {}\leavevmode \cleaders \hb@xt@ .44em{\hss .\hss }\hfill \kern \z@}

\newcommand{\printEndnotes}%
{%
	\chapter{Notes}
	\tabulinesep=1.5mm%
	% \begin{longtabu} to \linewidth{@{}X[0.75]>{\itshape}X[l,4]X[p,12]@{}}%
	\begin{longtabu} to \linewidth{@{}X[r,0.75]>{\leftskip 0.1in \parindent -0.1in}X[p,12]@{}}%
		\theEndnotes%
	\end{longtabu}%
}
\newcommand{\theEndnotes}{}
\newcommand{\makeEndnote}[4][]%
	{%
		\g@addto@macro\theEndnotes%
			{%
				\hyperref[enl:#3]{\pageref*{enl:#3}}\label{end:#3}%
				&%
				\emph{\ifthenelse{\equal{#1}{}}{#2}{#1}}:
				% &%
				#4\\%
			}%
		#2\label{enl:#3}\hyperref[end:#3]{\**}%
	}%

\makeatother