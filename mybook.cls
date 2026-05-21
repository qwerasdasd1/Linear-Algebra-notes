% mybook.cls — reusable lecture-note class based on ctexbook
% Merges FAA-lecture-notes encapsulation style with Star's conventions
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybook}[2026/05/20 Lecture notes class for Calculus, Linear Algebra, etc.]

% ===== Base: Chinese book class (provides \chapter) =====
\LoadClass[UTF8,a4paper,14pt]{ctexbook}

% ===== Pass options to packages loaded later =====
\PassOptionsToPackage{table}{xcolor}

% ===== English headings (override ctex Chinese defaults) =====
\ctexset{
    chapter/name = {Chapter\space},
    chapter/number = {\arabic{chapter}},
    section/number = {\arabic{section}},
    contentsname = {Contents},
    indexname = {Index},
    figurename = {Figure},
    tablename = {Table},
    abstractname = {Abstract},
    appendixname = {Appendix},
    bibname = {References},
}
\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\listtablename}{List of Tables}

% ===== Typography (FAA) =====
\RequirePackage{fix-cm}
\RequirePackage{lmodern}
\RequirePackage{newtxtext}
\RequirePackage{mathtools}
\RequirePackage{bbm}
\RequirePackage{bm}
\RequirePackage{interval}

% ===== Layout & utilities =====
\RequirePackage[strict]{changepage}
\RequirePackage{multicol}
\RequirePackage{cancel}
\RequirePackage{enumerate}
\RequirePackage{enumitem}
\RequirePackage{float}
\RequirePackage{adjustbox}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{centernot}

% ===== Graphics & drawing =====
\RequirePackage{graphicx}
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, positioning, patterns}
\RequirePackage{tikz-cd}
\RequirePackage{tcolorbox}
\tcbuselibrary{breakable}
\tcbuselibrary{most}

% ===== Math & physics (user) =====
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{mathrsfs}
\RequirePackage{physics}
\RequirePackage{esvect}
\RequirePackage{setspace}

% ===== Redefine \vec to use esvect's \vv =====
\renewcommand{\vec}[1]{\vv{#1}}

% ===== Header/footer =====
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\setlength{\headheight}{14.5pt}
\fancyhead[L]{\nouppercase{\leftmark}}
\fancyhead[R]{\nouppercase{\@title}}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

% ===== Geometry & spacing =====
\RequirePackage{geometry}
\geometry{a4paper,centering,scale=0.8}
\setstretch{1.2}

% ===== Hyperref (FAA colors) =====
\definecolor{mlv}{RGB}{40, 137, 124}
\RequirePackage[colorlinks, linkcolor=mlv, anchorcolor=mlv, citecolor=mlv]{hyperref}

% ===== Custom colors (FAA palette) =====
\definecolor{qlv}{RGB}{240, 251, 248}
\definecolor{slv}{RGB}{33, 96, 92}
\definecolor{qlan}{RGB}{239, 249, 251}
\definecolor{slan}{RGB}{3, 92, 127}
\definecolor{hlan}{RGB}{82, 137, 168}
\definecolor{qhuang}{RGB}{246, 250, 235}
\definecolor{shuang}{RGB}{77, 82, 59}
\definecolor{qzi}{RGB}{240, 243, 252}
\definecolor{szi}{RGB}{49, 55, 70}
\definecolor{pink}{RGB}{220, 115, 156}

% ===== Colored box environments (FAA) =====
\newenvironment{box1}{
    \begin{tcolorbox}[colback=hlan, colframe=hlan, arc=1mm]
}{\end{tcolorbox}}

\newenvironment{box2}{
    \begin{tcolorbox}[colback=hlan!5!white, colframe=hlan, arc=1mm]
}{\end{tcolorbox}}

\newenvironment{box3}{
    \begin{tcolorbox}[enhanced, colback=hlan!5!white, boxrule=0pt, frame hidden,
        borderline south={0.5mm}{0.1mm}{hlan}]
}{\end{tcolorbox}}

% Per-color side-border environments
\newenvironment{lvse}{
    \begin{tcolorbox}[breakable,enhanced, colback=qlv, boxrule=0pt, frame hidden,
        borderline west={0.7mm}{0.1mm}{slv}]
}{\end{tcolorbox}}

\newenvironment{lanse}{
    \begin{tcolorbox}[breakable,enhanced, colback=qlan, boxrule=0pt, frame hidden,
        borderline west={0.7mm}{0.1mm}{slan}]
}{\end{tcolorbox}}

\newenvironment{huangse}{
    \begin{tcolorbox}[breakable,enhanced, colback=qhuang, boxrule=0pt, frame hidden,
        borderline west={0.7mm}{0.1mm}{shuang}]
}{\end{tcolorbox}}

\newenvironment{zise}{
    \begin{tcolorbox}[breakable,enhanced, colback=qzi, boxrule=0pt, frame hidden,
        borderline west={0.7mm}{0.1mm}{szi}]
}{\end{tcolorbox}}

\newenvironment{pinkenv}{
    \begin{tcolorbox}[breakable,enhanced, colback=pink!10!white, boxrule=0pt, frame hidden,
        borderline west={0.7mm}{0.1mm}{pink!30!black}]
}{\end{tcolorbox}}

% ===== Inline highlight (FAA) =====
\newcommand{\hl}[1]{
    \tcbox[on line, arc=0pt, colback=hlan!5!white, colframe=hlan!5!white,
           boxsep=1pt, left=1pt, right=1pt, top=1.5pt, bottom=1.5pt, boxrule=0pt]
    {\bfseries\color{hlan}#1}}

% ===== Custom theorem style (FAA) =====
\newtheoremstyle{t}{0pt}{}{}{\parindent}{\bfseries}{}{1em}{}
\theoremstyle{t}

% ===== Theorem environments (user's my-prefix names) =====
% Numbered within section (natural for book class)
\newtheorem{mydef}{\color{slv} Definition}[section]
\newtheorem{mythm}[mydef]{\color{shuang} Theorem}
\newtheorem{mypro}[mydef]{\color{shuang} Proposition}
\newtheorem{mylma}[mydef]{\color{shuang} Lemma}
\newtheorem{mycor}[mydef]{\color{shuang} Corollary}
\newtheorem{myex}[mydef]{\color{szi} Example}
\newtheorem{myax}[mydef]{Axiom}
\newtheorem{mymthd}[mydef]{\color{szi} Method}
\newtheorem{myproperty}[mydef]{\color{slv} Property}
\newtheorem{mynot}[mydef]{\color{slv} Notation}
\newtheorem{myrmk}[mydef]{Remark}

% ===== Proof: standard amsthm proof, renamed to "Proof" =====
\renewcommand{\proofname}{Proof}

% ===== Wrapped theorem environments (FAA color code) =====
% Green (lvse) — definitions, notations
\newenvironment{definitionenv}{\begin{lvse}\begin{mydef}}{\end{mydef}\end{lvse}}
\newenvironment{notationenv}{\begin{lvse}\begin{mynot}}{\end{mynot}\end{lvse}}
\newenvironment{propertyenv}{\begin{lvse}\begin{myproperty}}{\end{myproperty}\end{lvse}}

% Yellow (huangse) — theorems, propositions, lemmas, corollaries
\newenvironment{theoremenv}{\begin{huangse}\begin{mythm}}{\end{mythm}\end{huangse}}
\newenvironment{propositionenv}{\begin{huangse}\begin{mypro}}{\end{mypro}\end{huangse}}
\newenvironment{lemmaenv}{\begin{huangse}\begin{mylma}}{\end{mylma}\end{huangse}}
\newenvironment{corollaryenv}{\begin{huangse}\begin{mycor}}{\end{mycor}\end{huangse}}

% Purple (zise) — examples, axioms, methods
\newenvironment{exampleenv}{\begin{zise}\begin{myex}}{\end{myex}\end{zise}}
\newenvironment{axiomenv}{\begin{zise}\begin{myax}}{\end{myax}\end{zise}}
\newenvironment{methodenv}{\begin{zise}\begin{mymthd}}{\end{mymthd}\end{zise}}

% Blue (lanse) — proofs
\NewDocumentEnvironment{proofenv}{o}{%
    \begin{lanse}%
    \IfNoValueTF{#1}{\begin{proof}}{\begin{proof}[#1]}%
}{%
    \end{proof}%
    \end{lanse}%
}

% Pink (pinkenv) — remarks
\newenvironment{remarkenv}{\begin{pinkenv}\begin{myrmk}}{\end{myrmk}\end{pinkenv}}

% ===== User's blackboard bold shortcuts =====
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\F}{\mathcal{F}}
\newcommand{\K}{\mathcal{K}}
\newcommand{\M}{\mathbf{M}_{m\times n}}

% ===== FAA-style upright symbols =====
\newcommand{\ee}{\mathrm{e}}
\newcommand{\ii}{\mathrm{i}}
\newcommand{\ztj}{\mathrm{j}}
\newcommand{\ztk}{\mathrm{k}}
% NOTE: \dd and \DD intentionally skipped — physics package provides \dd

% ===== Partial derivative shorthand =====
\newcommand{\pa}{\partial}

% ===== FAA-style hyperlink helpers =====
\newcommand{\defm}[2]{\hypertarget{#1}{{#2}}}
\newcommand{\refm}[2]{\hyperlink{#1}{\textcolor{mlv}{#2}}}

% ===== Display style shorthand =====
\newcommand{\dis}{\displaystyle}

% ===== Numbering =====
\numberwithin{equation}{section}
\numberwithin{figure}{section}

% ===== Table of contents depth =====
\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{3}

% ===== Compact lists =====
\setlist[itemize]{itemsep=2pt, topsep=4pt}
\setlist[enumerate]{itemsep=2pt, topsep=4pt}

\endinput
