//Produces the trivial S-ring over the cyclic group of order n.
triv:=function(n);
  return {{0},{1..n-1}}diff{{}};
end function;

//Produces the orbit S-rings for the cyclic group of order n.
auts:=function(n);
  g1:=Sym(n);
  g2:=sub<g1|{g1![(j*i-1) mod n+1:j in [1..n]]:i in [1..n]|GCD(n,i) eq 1}>;
  ss:=[x‘subgroup:x in Subgroups(g2)];
  orbs:=[Orbits(x):x in ss];
  return {{{z mod n: z in x}:x in y}:y in orbs};
end function;

//Given S-rings A, B, form the dot-product S-ring A.B.
dot:=function(A,B);
  a:=(#&join A);b:=(#&join B);n:=a*b;
  ap:=Round(n/a);bp:=Round(n/b);
  return {{(ap*a+bp*b) mod n:a in x, b in y}:x in A, y in B};
end function;

//A is an S-ring over a subgroup;
//B is an S-ring over a quotient.
//Given these, produce the wedge S-ring of A and B
swdg:=function(A,B,n);
  a:=(#&join A);b:=(#&join B);
  ap:=Round(n/a);bp:=Round(n/b);
  ab:=Round(a/bp);
  sg:={ab*i:i in {0..bp-1}};
  tf1:=sg eq &join{x:x in A|x meet sg ne {}};
  sg:={ap*i:i in {0..Round(a/bp)-1}};
  tf2:=sg eq &join{x:x in B|x meet sg ne {}};
  piA:={{ap*i:i in {0..ab-1}|&or{y mod ab eq i:y in x}}:x in A};
  tf3:=piA eq {x:x in B|x meet {ap*i:i in {0..ab-1}} ne {}};
  if not (tf1 and tf2 and tf3) then return triv(n);end if;
  sg:={b*i:i in {0..bp-1}};
  A:={{y*ap:y in x}:x in A};
  B:={&join{{y+i:i in sg}:y in x}:x in B};
  return A join {x:x in B|x meet &join A eq {}};
end function;

//given a list (prev) of S-rings over cyclic groups of smaller order,
//compute recursively the S-rings over the cyclic group of order n.
srcyc:=function(n,prev);
  if n le 2 then return {triv(n)};end if;
  divs:=[[a,b]:a,b in [2..n-1]|GCD(a,b) eq 1 and a*b eq n and a lt b];
  dts:=&join{{dot(x,y):x in prev[z[1]],y in prev[z[2]]}:z in divs};
  divs:=[[a,b]:a,b in {2..n-1}|n mod a eq 0 and a mod b eq 0];
  wdg:=&join{{swdg(x,y,n):x in prev[z[1]],y in prev[Round(n/z[2])]}
  :z in divs};
  return {triv(n)} join auts(n) join dts join wdg;
end function;

//recursively apply the function srcyc
//returns a list of all S-rings over cyclic groups
//of order leq n.
cycls:=function(n);
  prev:=[];
  for i:=1 to n do
    i;
    prev cat:=[srcyc(i,prev)];
  end for;
  return prev;
end function;

//does the minimum necessary to produce the S-rings
//over C_n.
cyc:=function(n);
  prev:=[];
  for i:=1 to n do
    if n mod i eq 0 then i;prev cat:=[srcyc(i,prev)];
    else prev cat:=[{triv(i)}];
    end if;
  end for;
  return prev[n];
end function;
