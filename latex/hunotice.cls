%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Notice class for HU with LaTeX.
% by Christian Kassung, ckassung@culture.hu-berlin.de.
%

\ProvidesClass{hunotice}[2021/03/12 Notice class for HU]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{humain}}
\ProcessOptions\relax

\LoadClass{humain}

\pagecolor{hu-bg-2}
\pagestyle{empty}

\RequirePackage{huheader,eso-pic}
\newcommand{\frontmatter}{%
  \noindent
  \begin{minipage}[t]{.5\textwidth}
    \begin{flushleft}
      \color{hu-blue}
      \sffamily
      {\bfseries\Large \@title \par}
      \vspace*{.5em}
      {\textcolor{hu-black-2}{\rule{10mm}{.5mm}}\par}
      \vspace*{.7em}
      {\large\@author \par}
      {\scriptsize \@date}
    \end{flushleft}
  \end{minipage}
  \begin{minipage}[t]{.5\textwidth}
    \AddToShipoutPicture*{%
      \put(335,660){%
        \includegraphics[width=7cm]{\@hukombi}
      }
    }
  \end{minipage}
  \vspace{20mm}
  }

\RequirePackage{tcolorbox}
\tcbuselibrary{breakable}
\tcbset{%
  colback=white,
  colframe=hu-blue,
  colbacktitle=white,
  coltitle=hu-blue,
  colupper=hu-blue,
  detach title,
  before upper={\tcbtitle\par\vspace{.7em}},
  height fill,
  arc=0mm,
  boxrule=.1mm,
  boxsep=5mm,
  fonttitle=\huge\sffamily\bfseries,
  fontupper=\Large\sffamily}
\newcommand{\block}[1]{%
  \begin{tcolorbox}[title=\@title]
    \parskip=0.5\baselineskip \advance\parskip by 0pt plus 2pt
    \parindent=0pt
    #1
  \end{tcolorbox}
  }
