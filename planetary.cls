% ---------------------------------------------------------------------------
% Planetary Research – Author Submission / Final Class
% Version 1.2 – 27 November 2025
% ---------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{planetary}[2025/09/15 v1.2 Planetary Research review/final class]

% ---------------- Options ----------------
\newif\ifprfinal
\DeclareOption{final}{\prfinaltrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% 11pt en final, 12pt en review
\ifprfinal
  \LoadClass[11pt,a4paper]{article}
\else
  \LoadClass[12pt,a4paper]{article}
\fi

% --------------- Packages ----------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
\geometry{margin=2.5cm} % base (review)

\RequirePackage{amsmath}
\RequirePackage{lineno}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{authblk}
\RequirePackage{orcidlink}
\RequirePackage{setspace}
\RequirePackage{lipsum}
%\RequirePackage{apacite} % AJOUT
\RequirePackage[style=authoryear,maxbibnames=99,backend=biber]{biblatex} % biblatex / XXX style with full author list in bibliography
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage[dvipsnames,table]{xcolor}
\RequirePackage{url} % AJOUT
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

\renewcommand{\familydefault}{\sfdefault}

% ------------- En-têtes/pieds -------------
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

% ---------------- Helpers -----------------
\newcommand{\summary}[1]{\small\vspace{1em}\noindent\textbf{Summary: } #1}

\newcommand{\mstype}[1]{\small\vspace{1em}\noindent\textbf{Manuscript type: } #1}


% ------------- Review vs Final ------------
% (1) Numéros de lignes : uniquement en review
\ifprfinal
  % rien
\else
  \AtBeginDocument{\linenumbers}
\fi

% (2) Réglages en FINAL
\ifprfinal
  % Marges : gauche 3.8 cm, le reste inchangé (2.5 cm)
  \geometry{left=3.8cm}

  \makeatletter
  % ---------- Titre/auteurs flushright SANS passer par authblk's \maketitle ----------
  \renewcommand\maketitle{%
    \begingroup
      \let\footnote\thanks % garder les \thanks
      \thispagestyle{firstpage}%
      \noindent
      \begin{flushright}
        {\LARGE\bfseries \@title \par}%
        \vskip 1em
        {\large \@author \par}%
        \vskip .5em
        {\normalsize \@date \par}%
      \end{flushright}
      \par\vskip 1.5em
    \endgroup
  }

  % ---------- Floats à droite, même si \centering est utilisé ----------
  % 1) Contenu des boîtes de float en raggedleft
  \g@addto@macro\@floatboxreset{\raggedleft\let\centering\raggedleft}
  % 2) Légendes alignées à droite
  \long\def\@makecaption#1#2{%
    \vskip\abovecaptionskip
    \begin{flushright}\small \textbf{#1.} #2\par\end{flushright}%
    \vskip\belowcaptionskip
  }
  \makeatother
\fi
% ------------------ Fin -------------------
