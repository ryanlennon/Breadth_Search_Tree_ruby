##Breadth_Search_Tree_ruby

This is a breadth first search using ruby that takes a .txt file of data, creates a tree with nodes, 
and traverses the adding values of the nodes or findinf the max value of a traversed path.

This was my first attempt at coding a tree/node structure so please feel free 
to leave any comments, recommendations for improvement, or refactoring tips.


The input comes from a .txt file that looks like the example below:
```
5
1 2
2 3
2 4
5 1
6
add 4 30
add 5 20
max 4 5
add 2 -20
max 4 5
max 3 4
```
To get an output you must add the following line at the end of the tree.rb file:

`Tree.final_output("path/of/your/file/goes/here")`

Using the input above as the example. Output should come out as follows:
```
30
20
10
```

