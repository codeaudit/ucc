ucc.is_valid <- function(df){
  if(!is.data.frame(df))
  {
    return(FALSE);
  }
  
  if(ncol(df) != 2)
  {
    return(FALSE);
  }
  
  if(!(
      (typeof(df[,1]) %in% c("numeric","integer","double"))
       &&
      (typeof(df[,2]) %in% c("numeric","integer","double"))
      )
  ){
    return(FALSE);
  }
  
  if( (any(is.na(df[,1]))) || (any(is.na(df[,2]))) )
  {
    return(FALSE);
  }
  
  return(TRUE);
}

ucc.sort <- function(df,dependent = 2){
  
  if(!(ucc.is_valid(df)))
  {
    stop("Provided data frame does not pass validation (exactly two numeric columns with no NA values)");
  }
  
  if(dependent != 1 && dependent != 2)
  {
    stop("Invalid value for dependent (1 or 2 only)");
  }
  
  independent = ifelse(dependent == 2,1,2);
  
  return(as.data.frame(df[order(df[,independent],df[,dependent]),]));
 
}

ucc.ranks <- function(df,dependent = 2)
{
  result <- ucc.sort(df,dependent = dependent)
  result[,dependent] = rank(result[,dependent],ties.method="random")
  
  return(result)
}

ucc.delta <- function(df,dependent = 2)
{
  
  result = c()
  
  for(i in 1:(nrow(df) - 1))
  {
    result = c(result,abs(df[i+1,dependent] - df[i,dependent]))
  }
  
  return(result);
  
}

ucc.y <- function(df)
{
  r <- ucc.ranks(df,2)
  d <- ucc.delta(r,2)
  return(1 - (3 * mean(d))/(nrow(r) + 1));
}

ucc.x <- function(df)
{
  r <- ucc.ranks(df,1)
  d <- ucc.delta(r,1)
  return(1 - (3 * mean(d))/(nrow(r) + 1));
}

ucc <- function(df)
{
  ux <- ucc.x(df)
  uy <- ucc.y(df)
  u <- max(c(ux,uy))
  
  nr = nrow(df)
  
  return(list(n=nr,ucc.x=ux,ucc.y=uy,ucc=u))
}