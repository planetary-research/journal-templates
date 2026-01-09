% ---------------------------------------------------------
% Planetary Research – Author Submission / Final Class
% Last modified: Jan. 9, 2026
% ---------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{planetary}[2026/01/09 Planetary Research review/final class]


% ------ Options ------------------------------------------
\newif\ifprfinal
\DeclareOption{final}{\prfinaltrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% 11pt for final, 12pt for review
\ifprfinal
  \LoadClass[11pt,a4paper]{article}
\else
  \LoadClass[12pt,a4paper]{article}
\fi


% --------------- Packages ----------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
\geometry{margin=2.5cm}

\PassOptionsToPackage{dvipsnames,table}{xcolor}

\RequirePackage{amsmath}
\RequirePackage{lineno}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{authblk}
\RequirePackage{orcidlink}
\RequirePackage{setspace}
\RequirePackage{lipsum}
\RequirePackage[style=authoryear,maxbibnames=99,backend=biber]{biblatex}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{url}
\RequirePackage{hyperref}
\RequirePackage{verbatim}
\RequirePackage{multirow}
\RequirePackage{textcomp}

\hypersetup{
  colorlinks=true,
  linkcolor=MidnightBlue,
  citecolor=MidnightBlue,
  urlcolor=MidnightBlue
}

\DeclareRobustCommand{\textsc}[1]{#1}

\renewcommand{\familydefault}{\sfdefault}


% ------ Headers/Footers ----------------------------------
\setlength{\headheight}{48pt}

\makeatletter
\fancypagestyle{firstpage}{%
  \fancyhf{}%
  \lhead{\includegraphics[height=1.2cm]{assets/journal_logo}}%
  \rhead{\textbf{\large \@title}}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}
\makeatother

\renewcommand\Affilfont{\normalfont\footnotesize}
\pagestyle{plain}


% ------ Helpers ------------------------------------------
\newcommand{\summary}[1]{\small\vspace{1em}\noindent\textbf{Summary: } #1}

\newcommand{\mstype}[1]{\small\vspace{1em}\noindent\textbf{Manuscript type: } #1}

\newcommand{\specialissue}[1]
{\small\vspace{1em}\noindent\textbf{Special issue: } #1}

\newcommand{\submissiondate}[1]{\small\noindent \textbf{Submission date:} #1}
\newcommand{\revisiondate}[1]{\small\noindent \textbf{Revision date:} #1}
\newcommand{\accepteddate}[1]{\small\noindent \textbf{Accepted date:} #1}

\newcommand{\license}
{\vfill
\noindent
\begin{tabular}{p{0.01\textwidth} p{0.32\textwidth} p{0.01\textwidth} p{0.43\textwidth} p{0.1\textwidth}}
\cline{1-5}
\scriptsize{\textcopyright}
& \scriptsize{The Author(s) 2026.}
&
& \multirow{2}{*}{\parbox{0.43\textwidth}{\vspace{1mm}\scriptsize{This work is licensed under a \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution License 4.0} which permits unrestricted use, distribution, and reproduction in any medium, provided the original work is properly cited.}}}
& \vspace{1mm}\includegraphics[height=1.5em]{assets/cc.png}\hspace{0.15em}\includegraphics[height=1.5em]{assets/by.png}
\end{tabular}}


% ------ Review vs Final ----------------------------------
% Line numbering : only for review
\ifprfinal
  % rien
\else
  \AtBeginDocument{\linenumbers}
\fi

% Final tuning
\ifprfinal
  % Margins : 3.8 cm on the left, 2.5 cm othberwise
  \geometry{left=3.8cm}

  \makeatletter
  % ------ Title/Authors flushleft  --------------------
  \renewcommand\maketitle{%
    \begingroup
      \let\footnote\thanks % garder les \thanks
      \thispagestyle{firstpage}%
      \noindent
      \begin{flushleft}
        {\LARGE\bfseries \@title \par}%
        \vskip 1em
        {\large \@author \par}%
        \vskip .5em
        {\normalsize \@date \par}%
      \end{flushleft}
      \par\vskip 2em
    \endgroup
  }

  % ------ Floats on the right --------------------------
  \long\def\@makecaption#1#2{%
    \vskip\abovecaptionskip

    \small \textbf{#1.} #2\par

    \vskip\belowcaptionskip
  }
  \makeatother
\fi

% ------ End ----------------------------------------------
