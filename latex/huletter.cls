%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Class for HU letters with LaTeX.
% By Christian Kassung, ckassung@culture.hu-berlin.de.
%

\ProvidesClass{huletter}[2025/03/25 Letters in HU style]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{humain}}
\ProcessOptions\relax

% \PassOptionsToPackage{table}{xcolor}
\LoadClass{humain}


% Set KOMA script options
\KOMAoptions{%
  fromrule=false,
  numericaldate=true,
  subject=beforeopening, 
  fontsize=11pt,
  enlargefirstpage=true
}

% Inerrant letter template of LaTeX
\setlength\parskip{0.7em}
\setlength\parindent{0\p@}

% Set layout, margins and positions
\RequirePackage[top=29mm,  bottom=46mm,
                left=25mm, right=20mm]{geometry}
\setlength{\textwidth}{117mm}
\setplength{firstfootvpos}{274mm}
\setplength{toaddrhpos}{25mm}
\setplength{toaddrwidth}{92mm}
\setplength{locvpos}{44mm}
\setplength{lochpos}{16mm}
\setplength{locheight}{160mm}
\setplength{locwidth}{44mm}

% Typesetting
\renewcommand{\familydefault}{\sfdefault}
\tolerance 1414
\hbadness 1414
\emergencystretch 1.5em
\hfuzz 0.3pt
\vfuzz \hfuzz

% Set some variables defining letter style
\setkomavar{date}{}
\pagestyle{headings}

% Recipient address
\setkomavar{backaddress}{%
  \makebox[0pt][l]{\@backaddress}}

% Set subject if not empty
\ifdefempty{\@subject}{}{\setkomavar{subject}{\@subject}}

% Closing with/without signature
%% TODO noch hübschen
\renewcommand*{\raggedsignature}{\raggedright}
\setkomavar{signature}{%
  \ifbool{signature}{%
    \includegraphics[scale=0.25]{signature}\\\fromname}{%
    \\\fromname}}

% Defining location margin
\RequirePackage{setspace}
\setkomavar{location}{%
  \raggedright%
  \color{hu-black}%
  \setstretch{.8}%

  \@labelText{\@faculty}

  \@LabelContent{\@department}

  \vspace*{10mm}
  \@labelText{\fromname}\\
  \@LabelContent{\@professorship}

  \vspace*{8mm}
  \@labeltext{\@datelabel:}\\\@labelcontent{\@date}

  \ifdefempty{\@processor}{}{%
    \@labeltext{\@processorlabel:}\\\@labelcontent{\@processor}}

  \ifdefempty{\@reference}{}{%
    \@labeltext{\@referencelabel:}\\\@labelcontent{\@reference}}

  \vspace*{4mm}
  \begin{minipage}[t]{40mm}
    \@labeltext{\@addresslabel:}\\
    \@labelcontent{\@address}\\
    \@labelcontent{Tel.\ \@fromphone}\\
    \@labelcontent{Fax \@fromfax}
  \end{minipage}

  \vspace*{4mm}
  \@labelcontent{\@fromemail}\\
  \@labelcontent{\@fromurl}

  \vspace*{4mm}
  \begin{minipage}[t]{40mm}
    \@labeltext{\@fromlocallabel:}\\
    \@labelcontent{\@fromlocal}
  \end{minipage}
}

% Defining header
\RequirePackage{eso-pic}
\setkomavar{firsthead}{%
  \AddToShipoutPicture*{%
    \put(45,745){%
      \includegraphics[width=109mm]{\@huwortmarke}
    }
    \put(380,720){%
      \includegraphics[width=4cm]{\@husiegel}
    }
  }
}

% Define first letter foot
\setkomavar{firstfoot}{%
  \null\hfill
  \parbox[t][\headheight][b]{40mm}{%
    \raggedright%
    \color{hu-black}%
    \setstretch{.8}%

    \@labeltext{\@fromconnectionslabel:}\\
    \@labelcontent{\@fromconnections}\\
    \@labeltext{\@officehourlabel:}\\
    \@labelcontent{\@officehour}\\
    \@labeltext{\@frombanklabel:}\\
    \@labelcontent{\@frombank}\\
    \@labelcontent{\@fromiban}

    %\vspace*{6mm}
  }
}

% Define letter header for following pages
\setkomavar{nexthead}{
  % \null\hfill
  \parbox[t][\headheight][t]{14cm}{%
    \raggedright%
    \color{hu-black}%
    \hfill \scriptsize\textbf{Seite: \thepage}
  }
}

% Define letter foot for following pages
\setkomavar{nextfoot}{%
}
