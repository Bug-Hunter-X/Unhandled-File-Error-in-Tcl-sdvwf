proc read_file {filename} { 
  set f [open $filename r]
  if {$f == -1} { 
    return -code error "Could not open file $filename"
  }
  set contents [read $f]
  close $f
  return $contents
}

set fileContent [read_file non_existent_file.txt]
if {[catch {puts $fileContent} msg]} {
  puts stderr "Error: $msg"
}
else {
 puts $fileContent
}
#Alternatively using try-finally block
proc readFile2 {filename} {
  set f [open $filename r]
  if {$f == -1} { 
    return -code error "Could not open file $filename"
  }
  try {
    set contents [read $f]
  } finally {
    close $f
  }
  return $contents
}

set fileContent2 [readFile2 non_existent_file.txt]
if {[catch {puts $fileContent2} msg]} {
 puts stderr "Error: $msg"
} else {
 puts $fileContent2
}