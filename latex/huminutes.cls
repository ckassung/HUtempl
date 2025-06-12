%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Class for HU meeting minutes with LaTeX.
% By Christian Kassung, ckassung@culture.hu-berlin.de.
%

\ProvidesClass{huminutes}[2025/03/25 Meeting minutes for HU]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{humain}}
\ProcessOptions\relax

% \PassOptionsToPackage{table}{xcolor}
\LoadClass{humain}

% Label redefinitions
\renewcommand*{\@authorlabel}{\GermanEnglish{Protokollführung}{Written by}}

% TODOs
% Labels für Tagesordnung, TOP, Protokoll in hulabels.sty
% Überschriften formatieren

\RequirePackage{xparse}
\newcommand{\@participantstable}{}
\NewDocumentCommand \participant { O{present} m }{
    \g@addto@macro \@participantstable {
        \multicolumn{2}{l}{#2}
          & \ifstrequal{#1}{present}    {$\bullet$}{}
          & \ifstrequal{#1}{absent}     {$\bullet$}{}
          & \ifstrequal{#1}{information}{$\bullet$}{}\\
    }
}

\RequirePackage{etoc}
\renewcommand*{\thesection}{TOP~\arabic{section}}
\etocsettocstyle{\section*{Tagesordnung}}{}
\etocsetstyle{section}{\parindent 0pt \parskip 0pt}{\etocnumber: }{
  \etocname{}\par}{}

\RequirePackage{tabularx,ltxtable}
\newcommand{\@tasktable}{}
\newcommand{\tasklist}{%
  \section{\@tasklistlabel}
  \vspace{-\baselineskip}
  \begin{longtable}{rp{0.55\textwidth}p{0.2\textwidth}l}
    \multicolumn{4}{@{}c@{}}{\@separator}\\*
    \@LabelText \@tasknumberlabel & \@LabelText \@tasklabel &
    \@LabelText \@responsiblelabel & \@LabelText \@duelabel\\*
    \multicolumn{4}{@{}c@{}}{\@separator}
    \@tasktable\\*
  \end{longtable}
}
\newcounter{sinteftask}
\newcommand{\task}[3]{%
    \g@addto@macro \@tasktable {%
      \\
      \refstepcounter{sinteftask}\thesinteftask & #1 & #2 & #3 \\*
      \multicolumn{4}{@{}c@{}}{\@separator}%
    }%
}

\RequirePackage{huheader,colortbl,setspace,rotating}
\newcommand{\frontmatter}{%
  \noindent%
  \begin{minipage}{\textwidth}

  \header

  \centering\sffamily%

  \bfseries\Large \@committee: \@title

  \Large (\@wheremeeting, \@whenmeeting)

  \end{minipage}
  \vspace{2ex}%

  \noindent\@separator%
  \rowcolors{4}{}{hu-black-3}%
  \begin{longtable}{p{0.4\textwidth}p{0.4\textwidth}ccc}
    \rowcolor{white}
      \parbox{\linewidth}{{\@LabelText\@initiatorlabel}\\\@LabelContent\@initiator}
      & \parbox{\linewidth}{{\@LabelText\@authorlabel}\\\@LabelContent\@author}
      & \raisebox{-1.5cm}{\begin{sideways}%
          \parbox{2cm}{\centering\@LabelText\@presentlabel}%
        \end{sideways}}
      & \raisebox{-1.5cm}{\begin{sideways}%
          \parbox{2cm}{\centering\@LabelText\@absentlabel}%
        \end{sideways}}
      & \raisebox{-1.5cm}{\begin{sideways}%
          \parbox{2cm}{\centering\@LabelText\@informationlabel}%
        \end{sideways}}\\
    \rowcolor{white}\multicolumn{5}{@{}c@{}}{\@separator}\\
    \rowcolor{white}\@LabelText\@participantslabel\\
    \endfirsthead
    \rowcolor{white} &
    & \raisebox{-1.5cm}{\begin{sideways}%
        \parbox{2cm}{\raggedright\@LabelText\@presentlabel}%
      \end{sideways}}
    & \raisebox{-1.5cm}{\begin{sideways}%
        \parbox{2cm}{\raggedright\@LabelText\@absentlabel}%
      \end{sideways}}
    & \raisebox{-1.5cm}{\begin{sideways}%
        \parbox{2cm}{\raggedright\@LabelText\@informationlabel}%\\
      \end{sideways}}\\
    \rowcolor{white} \multicolumn{5}{@{}c@{}}{\@separator}\\
    \rowcolor{white}\@LabelText\@participantslabel\\
    \endhead
    \@initiator & & $\bullet$ & &\\
    \@participantstable
  \end{longtable}
  \rowcolors{1}{}{} % Back to normal
  \noindent\@separator\\
  \hspace*{\tabcolsep}
  \begin{minipage}[t]{0.45\textwidth}
    \@LabelText\@committeelabel\\
    \@committee
  \end{minipage}\hfill
  \begin{minipage}[t]{0.3\textwidth}
    \@LabelText\@datelabel\\
    \@whenmeeting
  \end{minipage}
  \begin{minipage}[t]{0.2\textwidth}
    \@LabelText\@classificationlabel\\
    \@classification
  \end{minipage}\\
  \@separator

  \tableofcontents

  \section*{Protokoll}
}
