#set ndrain 0
set f Vd_@node|-1@_des.sav
TdrFileOpen $f
# loop through geometries
set icontact -1
set ng [TdrFileGetNumGeometry $f]
for {set ig 0} {$ig < $ng} {incr ig} {
  set nr [TdrGeometryGetNumRegion $f $ig]
  # loop through regions
  for {set ir 0} {$ir < $nr} {incr ir} {
    set mname [TdrRegionGetMaterial $f $ig $ir]
    set rname [TdrRegionGetName $f $ig $ir]
    puts " material $f $ig $ir: $mname"
    puts " material $f $ig $ir: $rname"
    if { $mname == "<contact>" } {
    incr icontact
    puts " Contact: $icontact"
    if { $rname == "drain" } {
      puts " Drain contact: $icontact"
      set idrain $icontact
      puts " DOE: ndrain $idrain"
    }
    }
  }
}
TdrFileClose $f
    




