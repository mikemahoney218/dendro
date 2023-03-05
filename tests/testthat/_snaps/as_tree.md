# as_tree works

    Code
      as_tree(x, c("x", "y", "z"))
    Output
      <dendro::tree>
       @ size        : int 49
       @ node_indices: Named int [1:49] 1 2 3 4 5 6 7 8 9 10 ...
       .. - attr(*, "names")= chr [1:49] "NULL" "1" "1" "1" ...
       @ next_idx    : int 50
       @ root        : Named int 1
       .. - attr(*, "names")= chr "NULL"
       @ nodes       :List of 49
       .. $ NULL: <dendro::node>
       ..  ..@ index   : int 1
       ..  ..@ value   : list()
       ..  ..@ parent  : int NA
       ..  ..@ children: int [1:16] 2 5 8 11 14 17 20 23 26 29 ...
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 2
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 3
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 3
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 2
       ..  ..@ children: int 4
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 4
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 3
       ..  ..@ children: int(0) 
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 5
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 6
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 6
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 5
       ..  ..@ children: int 7
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 7
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 6
       ..  ..@ children: int(0) 
       .. $ 3   : <dendro::node>
       ..  ..@ index   : int 8
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 9
       .. $ 3   : <dendro::node>
       ..  ..@ index   : int 9
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 8
       ..  ..@ children: int 10
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 10
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 9
       ..  ..@ children: int(0) 
       .. $ 4   : <dendro::node>
       ..  ..@ index   : int 11
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 12
       .. $ 4   : <dendro::node>
       ..  ..@ index   : int 12
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 11
       ..  ..@ children: int 13
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 13
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 12
       ..  ..@ children: int(0) 
       .. $ 5   : <dendro::node>
       ..  ..@ index   : int 14
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 15
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 15
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 14
       ..  ..@ children: int 16
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 16
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 15
       ..  ..@ children: int(0) 
       .. $ 6   : <dendro::node>
       ..  ..@ index   : int 17
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 18
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 18
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 17
       ..  ..@ children: int 19
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 19
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 18
       ..  ..@ children: int(0) 
       .. $ 7   : <dendro::node>
       ..  ..@ index   : int 20
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 21
       .. $ 3   : <dendro::node>
       ..  ..@ index   : int 21
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 20
       ..  ..@ children: int 22
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 22
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 21
       ..  ..@ children: int(0) 
       .. $ 8   : <dendro::node>
       ..  ..@ index   : int 23
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 24
       .. $ 4   : <dendro::node>
       ..  ..@ index   : int 24
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 23
       ..  ..@ children: int 25
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 25
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 24
       ..  ..@ children: int(0) 
       .. $ 9   : <dendro::node>
       ..  ..@ index   : int 26
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 27
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 27
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 26
       ..  ..@ children: int 28
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 28
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 27
       ..  ..@ children: int(0) 
       .. $ 10  : <dendro::node>
       ..  ..@ index   : int 29
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 30
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 30
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 29
       ..  ..@ children: int 31
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 31
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 30
       ..  ..@ children: int(0) 
       .. $ 11  : <dendro::node>
       ..  ..@ index   : int 32
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 33
       .. $ 3   : <dendro::node>
       ..  ..@ index   : int 33
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 32
       ..  ..@ children: int 34
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 34
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 33
       ..  ..@ children: int(0) 
       .. $ 12  : <dendro::node>
       ..  ..@ index   : int 35
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 36
       .. $ 4   : <dendro::node>
       ..  ..@ index   : int 36
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 35
       ..  ..@ children: int 37
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 37
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 36
       ..  ..@ children: int(0) 
       .. $ 13  : <dendro::node>
       ..  ..@ index   : int 38
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 39
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 39
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 38
       ..  ..@ children: int 40
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 40
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 39
       ..  ..@ children: int(0) 
       .. $ 14  : <dendro::node>
       ..  ..@ index   : int 41
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 42
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 42
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 41
       ..  ..@ children: int 43
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 43
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 42
       ..  ..@ children: int(0) 
       .. $ 15  : <dendro::node>
       ..  ..@ index   : int 44
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 45
       .. $ 3   : <dendro::node>
       ..  ..@ index   : int 45
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 44
       ..  ..@ children: int 46
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 46
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 45
       ..  ..@ children: int(0) 
       .. $ 16  : <dendro::node>
       ..  ..@ index   : int 47
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int 48
       .. $ 4   : <dendro::node>
       ..  ..@ index   : int 48
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 47
       ..  ..@ children: int 49
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 49
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 48
       ..  ..@ children: int(0) 

---

    Code
      as_tree(x, c("z", "y", "x"))
    Output
      <dendro::tree>
       @ size        : int 23
       @ node_indices: Named int [1:23] 1 2 3 4 5 6 7 8 9 10 ...
       .. - attr(*, "names")= chr [1:23] "NULL" "1" "1" "1" ...
       @ next_idx    : int 24
       @ root        : Named int 1
       .. - attr(*, "names")= chr "NULL"
       @ nodes       :List of 23
       .. $ NULL: <dendro::node>
       ..  ..@ index   : int 1
       ..  ..@ value   : list()
       ..  ..@ parent  : int NA
       ..  ..@ children: int [1:2] 2 13
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 2
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int [1:2] 3 8
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 3
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 2
       ..  ..@ children: int [1:4] 4 5 6 7
       .. $ 1   : <dendro::node>
       ..  ..@ index   : int 4
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 3
       ..  ..@ children: int(0) 
       .. $ 5   : <dendro::node>
       ..  ..@ index   : int 5
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 3
       ..  ..@ children: int(0) 
       .. $ 9   : <dendro::node>
       ..  ..@ index   : int 6
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 3
       ..  ..@ children: int(0) 
       .. $ 13  : <dendro::node>
       ..  ..@ index   : int 7
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 3
       ..  ..@ children: int(0) 
       .. $ 3   : <dendro::node>
       ..  ..@ index   : int 8
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 2
       ..  ..@ children: int [1:4] 9 10 11 12
       .. $ 3   : <dendro::node>
       ..  ..@ index   : int 9
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 8
       ..  ..@ children: int(0) 
       .. $ 7   : <dendro::node>
       ..  ..@ index   : int 10
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 8
       ..  ..@ children: int(0) 
       .. $ 11  : <dendro::node>
       ..  ..@ index   : int 11
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 8
       ..  ..@ children: int(0) 
       .. $ 15  : <dendro::node>
       ..  ..@ index   : int 12
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 8
       ..  ..@ children: int(0) 
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 13
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 1
       ..  ..@ children: int [1:2] 14 19
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 14
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 13
       ..  ..@ children: int [1:4] 15 16 17 18
       .. $ 2   : <dendro::node>
       ..  ..@ index   : int 15
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 14
       ..  ..@ children: int(0) 
       .. $ 6   : <dendro::node>
       ..  ..@ index   : int 16
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 14
       ..  ..@ children: int(0) 
       .. $ 10  : <dendro::node>
       ..  ..@ index   : int 17
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 14
       ..  ..@ children: int(0) 
       .. $ 14  : <dendro::node>
       ..  ..@ index   : int 18
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 14
       ..  ..@ children: int(0) 
       .. $ 4   : <dendro::node>
       ..  ..@ index   : int 19
       ..  ..@ value   :'data.frame':	0 obs. of  0 variables
       ..  ..@ parent  : int 13
       ..  ..@ children: int [1:4] 20 21 22 23
       .. $ 4   : <dendro::node>
       ..  ..@ index   : int 20
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 19
       ..  ..@ children: int(0) 
       .. $ 8   : <dendro::node>
       ..  ..@ index   : int 21
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 19
       ..  ..@ children: int(0) 
       .. $ 12  : <dendro::node>
       ..  ..@ index   : int 22
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 19
       ..  ..@ children: int(0) 
       .. $ 16  : <dendro::node>
       ..  ..@ index   : int 23
       ..  ..@ value   :'data.frame':	1 obs. of  0 variables
       ..  ..@ parent  : int 19
       ..  ..@ children: int(0) 

