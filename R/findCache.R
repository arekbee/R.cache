#########################################################################/**
# @RdocDefault findCache
#
# @title "Locates a cache file"
#
# \description{
#  @get "title" from a key object.
# }
#
# @synopsis
#
# \arguments{
#   \item{key}{An optional object from which a hexadecimal hash
#     code will be generated and appended to the filename.}
#   \item{...}{Additional argument passed to @see "generateCache".}
# }
#
# \value{
#   Returns the pathname as a @character, or @NULL if the no cached
#   data exists.
# }
#
# @author
#
# \seealso{
#  @see "generateCache".
#  @see "loadCache".
# }
#
# @keyword "programming"
# @keyword "IO"
# @keyword "internal"
#*/#########################################################################
setMethodS3("findCache", "default", function(key=NULL, ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Generate cache name from basename and hash object.
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  pathname <- generateCache(key=key, ...)

  if (file.exists(pathname) && !file.info(pathname)$isdir) {
    return(pathname)
  }

  pathnameT <- sprintf("%s.gz", pathname)
  if (file.exists(pathnameT) && !file.info(pathnameT)$isdir) {
    return(pathnameT)
  }

  return(NULL)
})
