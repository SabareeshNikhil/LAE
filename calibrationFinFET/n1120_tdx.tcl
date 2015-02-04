set f Vd_1119_des.sav
TdrFileOpen $f
set icontact -1
set ng [TdrFileGetNumGeometry $f]
for {set ig 0} {$ig < $ng} {incr ig} {
  set nr [TdrGeometryGetNumRegion $f $ig]
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
    





