% cls file for a Warsaw University of Technology thesis.
%
% Author: Ahmed Yesuf Nurye <anurye.yesuf@gmail.com>
%
% Based on cls file for a Robotics Institute Thesis by: 
%                            Felix Duvallet <felixd@gmail.com>

\LoadClassWithOptions{book}

%% dkoes - Here's a bunch of stuff taken from mjz-titlepage.sty that makes
% a pretty CMU techreport acceptable title page

%% titlepage parameters
%%   required: title, author, date, Year, trnumber, committee
%%   optional: permission, support, disclaimer, keywords

\def\title#1{\gdef\@title{#1}}
\def\author#1{\gdef\@author{#1}}
\def\indexNumber#1{\gdef\@indexNumber{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\institute#1{\gdef\@institute{#1}}
\def\fieldOfStudy#1{\gdef\@fieldOfStudy{#1}}
\def\specialisation#1{\gdef\@specialisation{#1}}
% \def\date#1{\gdef\@date{#1}}
\def\Year#1{\gdef\@Year{#1}}
% \def\trnumber#1{\gdef\@trnumber{#1}}
% \def\committee#1{\gdef\@committee{#1}}
\def\permission#1{\gdef\@permission{#1}}
\def\support#1{\gdef\@support{#1}}
\def\disclaimer#1{\gdef\@disclaimer{#1}}
\def\keywords#1{\gdef\@keywords{#1}}

\newsavebox{\@copyrightbox}
%\def\@copyrightnotice#1{{\small\sbox{\@copyrightbox}{#1}\ifthenelse{\lengthtest{\wd\@copyrightbox > \linewidth}}{\noindent #1 \par}{\begin{center} #1 \end{center}}}}
\def\@copyrightnotice#1{{\small\sbox{\@copyrightbox}{#1}\ifdim\wd\@copyrightbox>\linewidth \noindent #1 \par\else\begin{center} #1 \end{center}\fi}}

\def\maketitle{
\thispagestyle{empty}

% calculate skip needed to ensure that title appears in the cut-out
\newlength{\@cutoutvskip}
\setlength{\@cutoutvskip}{2.1875 true in}       % position of cut-out
\addtolength{\@cutoutvskip}{-1 true in}         % printer margin
\addtolength{\@cutoutvskip}{-\topmargin}
\addtolength{\@cutoutvskip}{-\headheight}
\addtolength{\@cutoutvskip}{-\headsep}

%% Centered things on the title page must be *physically* centered
%% on the page, so they line up with the cut-out window. So we hardwire
%% the margins for the title page so that left margin = right margin:
%%         left margin = (8.5in - textwidth)/2
\oddsidemargin=8.5in
\advance\oddsidemargin by -\textwidth
\oddsidemargin=.5\oddsidemargin
\advance\oddsidemargin by -1in % TeX sux
%
\let\footnoterule\relax
\vglue\@cutoutvskip

% WUT seal logo -- also links to the table of contents.
\begin{center}
    \hyperlink{contents}{  % Link To TOC -- define label in main file.
        \includegraphics[width=\textwidth]{src/figs/wut_seal.jpg}
    }
\end{center}

% Name of unit
\begin{center}
\fontsize{12}{14} \selectfont \@institute \par
\end{center}

% Study cycle
\begin{center}
\includegraphics[width=\textwidth]{src/figs/study_cycle.jpg}
\end{center}

% Field and specialisation
\begin{center}
in the field of study \@fieldOfStudy \par
and specialisation \@specialisation \par
\end{center}

% Thesis title
\vspace{2em}
\begin{center}
    \begin{minipage}[t]{.8\textwidth}
        \vfill
        \begin{center}
            {\fontsize{14}{16} \selectfont \@title \par}
        \end{center}
        \vfill
    \end{minipage}
\end{center}
\vspace{2em}

% Author
\begin{center}
    {\fontsize{21}{24} \selectfont \@author \par} 
    {\fontsize{12}{14} \selectfont student record book number {\@indexNumber}}
\end{center}
\vspace{1em}

% Advisor
\begin{center}
    {\fontsize{12}{14} \selectfont thesis supervisor \par \@supervisor}
\end{center}

% Year
\vfill
\begin{center}
    {\fontsize{12}{14} \selectfont Warsaw, \@Year \par}
\end{center}

% \vfill

\@ifundefined{@permission}{\@copyrightnotice{Copyright \copyright\ \@Year\ \@author}}{\@copyrightnotice{Copyright \copyright\ \@Year\ \@author. \@permission}}

\@ifundefined{@support}{}{{\medskip\footnotesize\noindent\@support\par}}

\@ifundefined{@disclaimer}{}{{\medskip\footnotesize\noindent\@disclaimer\par}}

% keywords go at bottom of page ii (the rear of the titlepage)
% if keywords are omitted, this page is blank

\clearpage
\thispagestyle{empty}
\@ifundefined{@keywords}{}{\vspace*{\fill} {\bf Keywords:} \@keywords}
\cleardoublepage
}

\newenvironment{dedication}
  {\cleardoublepage
    \thispagestyle{fancy}
    \vspace*{\stretch{1}} \begin{center} \em}
  {\end{center} \vspace*{\stretch{3}} \clearpage}

\newenvironment{pseudochapter}[1]
  {\cleardoublepage
    \thispagestyle{fancy}
   %%\vspace*{\stretch{1}}
   \begin{center} \large {\bf #1} \end{center}
   \begin{quotation}}
  {\end{quotation}
   \vspace*{\stretch{3}}
   \clearpage
  }

\newenvironment{abstract}{\begin{pseudochapter}{Abstract}}{\end{pseudochapter}}

\newenvironment{acknowledgments}{\begin{pseudochapter}{Acknowledgments}}{\end{pseudochapter}}

\newenvironment{funding}{\begin{pseudochapter}{Funding}}{\end{pseudochapter}}



%% dkoes - what follows is just a result of my personal style preferences
% most things are shamelessly ripped from various conference class files

%                       Utilities
%                       ---------


\newcommand{\centeroncapheight}[1]{%
  {\setbox\@tempboxa = \hbox{#1}%
   \@measurecapheight{\@tempdima}%         % Calculate ht(CAP) - ht(text)
   \advance \@tempdima by -\ht\@tempboxa   %           ------------------
   \divide \@tempdima by 2                 %                   2
   \raise \@tempdima \box\@tempboxa}}

\newbox{\@measbox}

\def \@measurecapheight #1{%                            {\dimen}
  \setbox\@measbox = \hbox{ABCDEFGHIJKLMNOPQRSTUVWXYZ}%
  #1 = \ht\@measbox}

\long\def \@titlefootnote #1#2{%
  \insert\footins{%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
%%%    \protected@edef\@currentlabel{%
%%%       \csname p@footnote\endcsname\@thefnmark}%
    \color@begingroup
      \def \@makefnmark {$^{#1}$}%
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#2\@finalstrut\strutbox}%
    \color@endgroup}}

%                       Lists
%                       -----

\setlength{\topsep}{1pt}
 \setlength{\itemsep}{1pt}
\setlength{\parsep}{3pt}

\renewcommand{\labelitemi}{{\small \centeroncapheight{\textbullet}}}
\renewcommand{\labelitemii}{\centeroncapheight{\rule{2.5pt}{2.5pt}}}
\renewcommand{\labelitemiii}{$-$}
\renewcommand{\labelitemiv}{{\Large \textperiodcentered}}

\renewcommand{\@listi}{%
  \leftmargin = \leftmargini
  \listparindent = 0pt}

\let \@listI = \@listi

\renewcommand{\@listii}{%
  \leftmargin = \leftmarginii
  \topsep = 1pt
  \labelwidth = \leftmarginii
  \advance \labelwidth by -\labelsep
  \listparindent = \parindent}

\renewcommand{\@listiii}{%
  \leftmargin = \leftmarginiii
  \labelwidth = \leftmarginiii
  \advance \labelwidth by -\labelsep
  \listparindent = \parindent}

\renewcommand{\@listiv}{%
  \leftmargin = \leftmarginiv
  \labelwidth = \leftmarginiv
  \advance \labelwidth by -\labelsep
  \listparindent = \parindent
}


% mainmatter is ignoring openany, fix
\renewcommand\mainmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmattertrue
  \pagenumbering{arabic}
}