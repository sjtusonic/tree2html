proc dump_full_structure {} {
   global T
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
   }
}

proc gen {lv num_list src} {

}

proc put_name_child_head {div_id name sub_div_id {color green}} {
   puts "
<div id=\"$div_id\" style=\"display:inline\">
   "
}

proc put_name_main {div_id name sub_div_id lv ref_name fo_cnt_str {color green}} {
   if {[regexp "SDF|DF" $ref_name]} {
      set blank [string repeat " " [expr 3*$lv]]
      puts "
<div id=\"$div_id\" style=\"color:$color\"
>$div_id+$blank $name ($ref_name) NA</div>
      "
      return
   } else {
      set blank [string repeat " " [expr 3*$lv]]
      puts "
<div id=\"$div_id\" style=\"color:$color\" onclick = \"document.all.$sub_div_id.style.display= (document.all.$sub_div_id.style.display == 'none')?'':'none'
                                                       this.style.color                      = (document.all.$sub_div_id.style.display == 'none' )?'red':'green'
\">$div_id+$blank $name ($ref_name) $fo_cnt_str</div>     
      "
   }
}
