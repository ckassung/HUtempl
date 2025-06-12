%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Generic class for HU documents with LaTeX.
% by Christian Kassung, ckassung@culture.hu-berlin.de.
%

\ProvidesClass{humain}[2025/03/23 Generic class for HU documents]

\RequirePackage{etoolbox}

% Whether the language is German
% defaults to true
\newbool{german}
\booltrue{german}

% Whether the document for printing (CMYK)
% defaults to false, i.e. RGB display
\newbool{print}

% Whether the document has a personal header
% defaults to false, i.e. no header
\newbool{header}

% Whether the document is signed
% default to false, i.e. closing without signature
\newbool{signature}

%%% BEGIN Options section %%%
% Provide alternative translations in German and English
\newcommand{\GermanEnglish}[2]{\ifbool{german}{#1}{#2}}

% Classification options, including their defaults
\newcommand*{\@classification}{öffentlich}
\newcommand*{\@parentClass}{scrartcl}

\DeclareOption{internal}{%                                        
  \renewcommand*{\@classification}{nicht öffentlich}%
}                                                                             
\DeclareOption{public}{%
  \renewcommand*{\@classification}{öffentlich}%
}      

\DeclareOption{scrartcl}{%
  \renewcommand{\@parentClass}{scrartcl}
}
\DeclareOption{scrlttr2}{%
  \renewcommand{\@parentClass}{scrlttr2}
}

\DeclareOption{german}    {\booltrue{german}}
\DeclareOption{english}   {\boolfalse{german}}
\DeclareOption{print}     {\booltrue{print}\PassOptionsToPackage{cmyk}{xcolor}}
\DeclareOption{signature} {\booltrue{signature}}
\DeclareOption{header}    {\booltrue{header}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@parentClass}}
\ProcessOptions\relax

%%% END Options section %%%

\LoadClass[a4paper,11pt]{\@parentClass}

% Use a prettier date format and adapt according to language
\RequirePackage[calc,useregional=numeric]{datetime2}

% TODO auf Polyglossia umstellen
\RequirePackage[\ifbool{german}{main=german}{}]{babel}
\RequirePackage[babel,german=guillemets]{csquotes}

% Set fonts
\RequirePackage{fontspec,unicode-math}
\defaultfontfeatures{Ligatures=TeX}
\setmainfont{Georgia}
\setsansfont{Arial}

% Define main logo with image path, whether CMYK (print) or RG (screen)
\RequirePackage{graphicx}
\graphicspath{/logo/}
\newcommand{\@huwortmarke}{hu_wortmarke_einzeilig_\ifbool{print}{cmyk}{rgb}}
\newcommand{\@husiegel}{hu_siegel_\ifbool{print}{cmyk}{rgb}}
\newcommand{\@hukombi}{hu_kombi_\ifbool{print}{cmyk}{rgb}}

\RequirePackage{hulabels}

% Set colours and colour elements
\RequirePackage{hucolor}                                                 
\addtokomafont{title}{\color{hu-blue}}
% Separating line
\newcommand{\@separator}{%                                                      
  \rule{0ex}{\baselineskip}%                                                              
  \textcolor{hu-blue-4}{\rule[1ex]{\textwidth}{0.25pt}}%                        
}

% PDFs
\RequirePackage{hyperref}
\hypersetup{%
  pdftitle=\@title,%
  pdfauthor=\@author,%
  colorlinks=true,%
  linktoc=none,%
  linkcolor=hu-blue,%
  citecolor=hu-blue,%
  filecolor=hu-blue,%
  menucolor=hu-blue,%
  urlcolor=hu-blue,%
  breaklinks=true}

% \RequirePackage[hyphens,spaces]{url}
% \urlstyle{same}
