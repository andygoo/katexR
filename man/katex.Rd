% Generated by roxygen2 (4.0.2): do not edit by hand
\name{katex}
\alias{katex}
\title{render function for KaTeX in R}
\usage{
katex(tex = "", tag = "div", inline = FALSE, style = NULL)
}
\arguments{
\item{tex}{String containing the formula to be parsed and rendered}

\item{tag}{String for the type of html tag to use. \code{tag = "div"} is the default.}

\item{inline}{Logical to use \code{\\displaystyle}.  Default is \code{FALSE}.
Change to \code{TRUE} if you would like your formula to be included inline.
See \href{https://github.com/Khan/KaTeX/issues/66}{this issue} for more details.}

\item{style}{String with the style attributes, such as \code{style = "font-size:20px;text-align:center;"}.
Note, the behavior of \code{katexR} is different from standard \code{htmlwidgets}, and \code{height}
and \code{width} parameters will not work.}
}
\description{
render function for KaTeX in R
}
\examples{
\dontrun{
# a simple mean formula
katex("\\\\frac{1}{n} \\\\sum_{i=i}^{n} x_{i}")

# to illustrate use with a different tag and some styling
katex(
 "\\\\frac{1}{n} \\\\sum_{i=i}^{n} x_{i}"
 ,tag = "p"
 ,style = "color:blue; font-size:300\%; text-align:center;"
)

# katex plays nicely with htmltools
library(htmltools)

html_print(tagList(
 tags$div(
   tags$pre( "\\\\frac{1}{n} \\\\sum_{i=i}^{n} x_{i}" )
   , katex( "\\\\frac{1}{n} \\\\sum_{i=i}^{n} x_{i}", tag="span" )
 )
))

# or if you want to customize your KaTeX experience
#   use katex to just get the required dependencies
html_print(tagList(
  tags$p( id = "katex-one" )
  ,tags$script( "
     katex.render('\\\\\\\\frac{1}{n} \\\\\\\\sum_{i=i}^{n} x_{i}',document.getElementById('katex-one'))
  ")
  ,katex() # empty means just use for js/css dependencies
))


}
}

