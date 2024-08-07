#' getDeviceProps
#' 
#' The \code{getDeviceProps} function returns some properties of the CUDA
#' device specified by the \code{id} argument.
#'
#' @param id ID of the CUDA device for which properties should be returned.
#' Defaults to \code{0} for the first device.
#'
#' @export
getDeviceProps = function(id = 0) {
  
  rst <- .getDeviceProps(id = id)
  
  txt <- c("Found CUDA capable device.\n",
           "Device ID:\t\t%s\n",
           "Device name:\t\t%s\n",
           "Integraded device:\t%s\n",
           "Compute capability:\t%s\n")
  
  msg <- sprintf(paste(txt, collapse = ""),
                 rst$id,
                 rst$deviceName,
                 as.logical(rst$integr),
                 sprintf("%s.%s", rst$mjr, rst$mnr))
  cat(msg)
}