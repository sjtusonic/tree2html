#!/usr/loca/bin/wish
source ../small_lib/include.tcl
source ./tree2html.proc.tcl

### Tree
package require struct
catch {T destroy}
::struct::tree T

T insert root end n1
T insert root end n2
T insert n1 end n3
T insert n1 end n4
T insert n4 end n5
T insert n5 end n6
T insert n5 end n7
T insert n2 end n8
T insert n2 end n9
T insert n9 end n10
T insert n9 end n11

T insert n7 end n7_1
T insert n7 end n7_2

T insert n7_2 end n7_2_1
T insert n7_2 end n7_2_2

T insert n7_2_1 end n7_2_1_1
T insert n7_2_1 end n7_2_1_2

dump_full_structure  ;# of T

#
if {0} {
   T walk root -order pre -type dfs node {
      set n [T depth $node]
      set n1 $n
      while {$n1 >0} {
         puts -nonewline "   ";
         incr n1 -1
      }
      #puts [T get $node ]
      #puts "$node:\tlevel=$n"
      puts [format "lv%s:%s" \
      $n\
      $node]
      #puts "node=$node;father=[T parent $node]"
      #puts "node=$node;child =[T children $node]"
      #
      if {$node ne "root"} {
      #puts "node=$node;index =[T index $node]"
      } else {

      }
   }

}

puts =================

#redirect_file out.html [put_name_main var1 src sub 9 cellRef "FO"]
#redirect_file out.html  {put_name_main var1 src sub 9 cellRef "FO"}

T walk root -order pre -type dfs node {
   set n [T depth $node]
   set n1 $n
   while {$n1 >0} {
      puts -nonewline "   ";
      incr n1 -1
   }
   #puts [format "lv%s:%s" \
   #$n\
   #$node]

   puts $n
   set attribute d
   set num_list {1 2 3}
   set comb [format %03d $n]__N[join $num_list "_"]
   #puts "put_name_main $attribute$comb $node sub $n cellRef FO"
   put_name_main $attribute$comb $node sub $n cellRef "FO"

   #puts "node=$node;father=[T parent $node]"
   #puts "node=$node;child =[T children $node]"
   #
   if {$node ne "root"} {
   #puts "node=$node;index =[T index $node]"
   } else {

   }
}
