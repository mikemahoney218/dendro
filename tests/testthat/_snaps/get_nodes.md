# multiplication works

    Code
      get_nodes(z, 1)
    Output
      $root
      <dendro::node>
       @ index   : int 1
       @ value   :'data.frame':	0 obs. of  0 variables
       @ parent  : int NA
       @ children: int [1:2] 2 3
      

---

    Code
      get_nodes(z, "root")
    Output
      $root
      <dendro::node>
       @ index   : int 1
       @ value   :'data.frame':	0 obs. of  0 variables
       @ parent  : int NA
       @ children: int [1:2] 2 3
      

---

    Code
      get_nodes(z)
    Output
      $root
      <dendro::node>
       @ index   : int 1
       @ value   :'data.frame':	0 obs. of  0 variables
       @ parent  : int NA
       @ children: int [1:2] 2 3
      
      [[2]]
      <dendro::node>
       @ index   : int 2
       @ value   : list()
       @ parent  : int 1
       @ children: int 4
      
      [[3]]
      <dendro::node>
       @ index   : int 3
       @ value   : list()
       @ parent  : int 1
       @ children: int(0) 
      
      [[4]]
      <dendro::node>
       @ index   : int 4
       @ value   : list()
       @ parent  : int 2
       @ children: int 5
      
      [[5]]
      <dendro::node>
       @ index   : int 5
       @ value   : list()
       @ parent  : int 4
       @ children: int(0) 
      

