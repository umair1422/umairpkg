\name{dijkstra}
\alias{dijkstra}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
dijkstra(graph, init_node)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{graph}{
%%     ~~Describe \code{graph} here~~
}
  \item{init_node}{
%%     ~~Describe \code{init_node} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (graph, init_node) 
{
    if (class(init_node) != "numeric") {
        stop("Input type is not correct")
    }
    if (colnames(graph[1]) != "v1" || colnames(graph[2]) != "v2" || 
        colnames(graph[3]) != "w" || ncol(graph) != 3) {
        stop("Graph does not contain v1,v2,w format")
    }
    Result_Vec <- c()
    unvisited_nodes <- unique(graph[, 1])
    if (init_node > max(unvisited_nodes)) {
        stop("Initial node is out of range")
    }
    for (i in 1:length(unvisited_nodes)) {
        Result_Vec <- c(Result_Vec, Inf)
    }
    names(Result_Vec) <- unvisited_nodes
    Result_Vec[init_node] <- 0
    for (i in 1:length(unvisited_nodes)) {
        DistancesToOtherNodes <- Result_Vec[names(Result_Vec) \%in\% 
            unvisited_nodes]
        node <- DistancesToOtherNodes[which.min(DistancesToOtherNodes)]
        WeightOfEdges <- graph[which(graph[, 1] == names(node)), 
            ]
        for (i in 1:nrow(WeightOfEdges)) {
            if (Result_Vec[WeightOfEdges[i, 2]] > node + WeightOfEdges[i, 
                3]) {
                Result_Vec[WeightOfEdges[i, 2]] <- node + WeightOfEdges[i, 
                  3]
            }
        }
        unvisited_nodes <- unvisited_nodes[-which(unvisited_nodes == 
            names(node))]
    }
    vc <- c()
    for (i in 1:length(Result_Vec)) {
        vc <- append(vc, unname(Result_Vec[i]))
    }
    return(vc)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
